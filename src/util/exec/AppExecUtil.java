package util.exec;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.exception.HinaException;

public class AppExecUtil {

	private AppExecUtil(){

	}

	private static Map<String, Process> map = new HashMap<String, Process>();

	static public void execApp(String targetApplication, String path) throws HinaException {


		if (path != null) {
			Runtime runtime = Runtime.getRuntime();
			String cmd = targetApplication + " " + path;
			try {

				Process p = runtime.exec(cmd);

				map.put(targetApplication + path, p );

			} catch (IOException e) {
				throw new HinaException("アプリケーションの起動に失敗しました。[" + targetApplication + "]", e);
			}
		}
	}

	static public void destroy(String targetApplication, String path) {
		String key = targetApplication + path;
		Process p = map.get(key);
		p.destroy();
		p = null;
		map.remove(key);
	}

	static public void kill(String processName) throws HinaException {

		List<String> pIdList = ProcessWatch.getProsessId(processName);
		for (String id : pIdList) {
			execApp("cmd /c", "taskkill /pid " + id + " /f");
		}

	}

	/**
	 * エクスプローラの起動とブラウザの起動に使用できる<br>
	 * 例）<br>
	 * AppExecUtil.execExplorer("C:\\workspace\\290.PingMan\\workspace\\PingMan\\src\\util");<br>
	 * AppExecUtil.execExplorer("https://www.yahoo.co.jp/");
	 * @param path
	 * @throws HinaException
	 */
	static public void execExplorer(String path) throws HinaException {
		execApp("explorer", path);
	}

	static public void execSakura(String path) throws HinaException {
		execApp("C:\\Program Files (x86)\\sakura\\sakura.exe", "\"" + path + "\"");
	}
}
