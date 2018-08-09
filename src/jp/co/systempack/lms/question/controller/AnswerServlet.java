package jp.co.systempack.lms.question.controller;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.modelmapper.TypeToken;

import jp.co.systempack.lms.entity.Answer;
import jp.co.systempack.lms.question.form.AnswerForm;
import jp.co.systempack.lms.question.service.AnswerService;
import util.converter.ModelMapperUtil;

/**
 * Servlet implementation class AnswerServlet
 */
@WebServlet("/answer")
public class AnswerServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  /**
   * doGet
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    // テスト的に設定
    int questionId = 1;

    // 業務ロジック処理（答えのセットを取得）
    AnswerService service = new AnswerService();
    List<Answer> answerList = service.getAnswerListByQuestionId(questionId);

    // データ変換
    Type listType = new TypeToken<List<AnswerForm>>() {
    }.getType();
    List<AnswerForm> answerFormList = ModelMapperUtil.getInstance().map(answerList, listType);

    // セッションに保存
    HttpSession session = request.getSession(true);
    session.setAttribute("answerList", answerFormList);

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
