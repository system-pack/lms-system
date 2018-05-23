package servlet.practice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * プラクティス（前処理）画面
 */
@WebServlet("/practice")
public class PracticePreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * doGet<br>
     * プラクティス画面の前処理を行う
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 前処理

        // フォワード
        request.getRequestDispatcher("/WEB-INF/jsp/practice/practice.jsp").forward(request, response);
    }

    /**
     * doGet<br>
     * 処理をdoPostに委譲
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
