package jp.co.systempack.lms.question.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.systempack.lms.entity.Text;
import jp.co.systempack.lms.question.dto.QuestionSetDto;
import jp.co.systempack.lms.question.form.QuestionDefaultForm;
import jp.co.systempack.lms.question.form.QuestionForm;
import jp.co.systempack.lms.question.form.TextForm;
import jp.co.systempack.lms.question.service.QuestionService;
import util.converter.ModelMapperUtil;

/**
 * 問題画面コントローラ
 */
@WebServlet("/question")
public class QuestionServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * doGet
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    // テスト的に設定
    int questionId = 1;
    int textId = 1;

    // 業務ロジック処理（問題セット取得）
    QuestionService service = new QuestionService();
    QuestionSetDto questionSet = service.getQuestionSetByQuestionId(questionId);

    // 業務ロジック処理（テキストを取得）
    Text text = service.getTextByTextId(textId);

    // データ変換
    QuestionForm questionFrom = ModelMapperUtil.getInstance().map(questionSet.getQuestion(), QuestionForm.class);
    List<QuestionDefaultForm> questionDefaultFormList = new ArrayList<QuestionDefaultForm>();
    ModelMapperUtil.getInstance().map(questionSet.getQuestionDefaultList(), questionDefaultFormList);
    TextForm textFrom = ModelMapperUtil.getInstance().map(text, TextForm.class);

    // リクエストに保存
    request.setAttribute("question", questionFrom);
    request.setAttribute("questionDefaultList", questionDefaultFormList);
    request.setAttribute("text", textFrom);

    // フォワード
    request.getRequestDispatcher("/WEB-INF/jsp/question/question.jsp").forward(request, response);
    return;
  }

  /**
   * doPost
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request, response);
  }

}
