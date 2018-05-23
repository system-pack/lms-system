package util.read;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.List;

import org.apache.pdfbox.io.IOUtils;
import org.apache.pdfbox.io.MemoryUsageSetting;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.encryption.AccessPermission;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFShape;
import org.apache.poi.xssf.usermodel.XSSFSimpleShape;
import org.mozilla.universalchardet.UniversalDetector;

public class ReadUtil {

	final static Object LOCK_OBJECT = new Object();

	/**
	 * PDFの内容を取得するメソッド
	 * @param file
	 * @param tmpPath
	 * @return
	 */
	public static String readPDF(File file, String tmpPath) {

		// TOTO:I/Oを複数としないためシンクロナイズとした
		// テンポラリのファイル名を一意とすれば、シンクロナイズの必要はない。
		synchronized (LOCK_OBJECT) {

			PDDocument document = null;
			Writer output = null;
			String content = null;

			try {

				MemoryUsageSetting mus = MemoryUsageSetting.setupMixed(/* max bytes= */1000000);
				mus.setTempDir(new File(tmpPath));

				document = PDDocument.load(file, /* password= */ "", mus);

				AccessPermission ap = document.getCurrentAccessPermission();
				if (!(ap.canExtractContent())) {
					throw new IOException("You do not have permission to extract text");
				}

				output = new OutputStreamWriter(new FileOutputStream(new File(tmpPath, "PDF_TMP.txt")));
				PDFTextStripper stripper = new PDFTextStripper();
				// stripper.setSortByPosition(sort);
				// stripper.setShouldSeparateByBeads(separateBeads);
				// stripper.setStartPage(startPage);
				// stripper.setEndPage(endPage);
				stripper.writeText(document, output);

				// TODO：すべてメモリ上に読み込むため、巨大なファイルの場合、問題となる。
				// ストリームのままで取得して、ストリームでDBに渡す必要があるかもしれない。
				content = readText(new File(tmpPath, "pdf_tmp.txt"));

			} catch (Exception e) {
				// TODO 例外処理は必要に応じて書き換えてください
				System.err.println("Error processing " + file + e.getMessage());
			} finally {
				IOUtils.closeQuietly(output);
				IOUtils.closeQuietly(document);
				if (new File(tmpPath, "pdf_tmp.txt").exists()) {
					new File(tmpPath, "pdf_tmp.txt").delete();
				}
			}

			return content;
		}
	}

	public static String readExcel(File file) {

		String content = null;
		try (Workbook wb = WorkbookFactory.create(new FileInputStream(file));) {

			// 共通インターフェースを扱える、WorkbookFactoryで読み込む

			// 全セルを表示する
			StringBuilder sb = new StringBuilder();
			for (Sheet sheet : wb) {
				for (Row row : sheet) {
					for (Cell cell : row) {
						sb.append(getCellValue(cell));
						sb.append("\n");
					}

					// 図形のテキストも付加
					sb.append(getShapeValue(sheet));
				}
			}

			// TODO：すべてメモリ上に読み込むため、巨大なファイルの場合、問題となる。
			// ストリームのままで取得して、ストリームでDBに渡す必要があるかもしれない。
			content = sb.toString();

		} catch (Exception e) {
			// TODO 例外処理は必要に応じて書き換えてください
			e.printStackTrace();
		}
		return content;
	}

	private static String getCellValue(Cell cell) {
		switch (cell.getCellTypeEnum()) {

		case STRING:

			return cell.getRichStringCellValue().getString();

		case NUMERIC:

			if (DateUtil.isCellDateFormatted(cell)) {

				return cell.getDateCellValue().toString();

			} else {

				return Double.toString(cell.getNumericCellValue());

			}

		case BOOLEAN:

			return Boolean.toString(cell.getBooleanCellValue());

		case FORMULA:

			return cell.getCellFormula();

		default:
			return null;

		}

	}

	private static String getShapeValue(Sheet sheet) {

		// 図形描画の為のXSSFDrawingから図形のListを取得
		XSSFDrawing drawing = (XSSFDrawing) sheet.createDrawingPatriarch();
		List<XSSFShape> shapeList = drawing.getShapes();

		// 図形を探索
		StringBuilder sb = new StringBuilder();
		for (XSSFShape sh : shapeList) {
			// 実際の型を確認
			if (sh instanceof XSSFSimpleShape) {
				XSSFSimpleShape ss = (XSSFSimpleShape) sh;
				sb.append(ss.getText());
				sb.append("\n");
			}
		}

		return sb.toString();
	}

	private static String readText(File file) {

		String content = null;
		try (FileInputStream fis = new FileInputStream(file);
				InputStreamReader isr = new InputStreamReader(fis, getEncoding(file));
				BufferedReader br = new BufferedReader(isr);) {

			StringBuilder sb = new StringBuilder();
			String line = null;
			while ((line = br.readLine()) != null) {

				sb.append(line);
				sb.append("\n");

			}

			// TODO：すべてメモリ上に読み込むため、巨大なファイルの場合、問題となる。
			// ストリームのままで取得して、ストリームでDBに渡す必要があるかもしれない。
			content = sb.toString();

			/*
			 * if (content.charAt(0) == 65279) {// UTF-8 marker content =
			 * content.substring(1); }
			 */

		} catch (IOException e) {
			// TODO 例外処理は必要に応じて書き換えてください
			e.printStackTrace();
		}

		return content;
	}

	public static String getEncoding(File file) {

		String encoding = null;
		try (java.io.FileInputStream fis = new java.io.FileInputStream(file);) {

			byte[] buf = new byte[4096];
			UniversalDetector detector = new UniversalDetector(null);

			int nread;
			while ((nread = fis.read(buf)) > 0 && !detector.isDone()) {

				detector.handleData(buf, 0, nread);

			}

			detector.dataEnd();
			encoding = detector.getDetectedCharset();

		} catch (Exception e) {
			// TODO 例外処理は必要に応じて書き換えてください
			e.printStackTrace();
		}

		return encoding;
	}

}
