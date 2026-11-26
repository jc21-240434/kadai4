package test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import mygoogle.ai.studio.GoogleAIStudioAPI;

/**
 * Servlet implementation class TestGoogle
 */
@WebServlet("/googleai")
public class TestGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TestGoogle() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.sendRedirect("testForm.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    

		//APIインターフェースのインスタンスを作る
		GoogleAIStudioAPI api = new GoogleAIStudioAPI();
	
		//質問の取り込み
		String question = request.getParameter("question");
	
		//APIを呼び出して質問を投入し、結果を取得
		String ans = api.getAnswer(question);
	
		//JSPへ転送する準備
		request.setAttribute("QUESTION", question);
		request.setAttribute("ANS", ans);
		//JSPへ転送
		request.getRequestDispatcher("testForm.jsp").forward(request, response);
    }
}
