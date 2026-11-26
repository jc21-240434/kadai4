package com.example.gyutan;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import mygoogle.ai.studio.GoogleAIStudioAPI;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // フォームから問い合わせ内容を取得（name="query" の場合）
        String query = request.getParameter("query");

        // 空欄 または null の時はトップページへリダイレクト
        if (query == null || query.trim().isEmpty()) {
            response.sendRedirect("index.jsp");
            return;
        }

        // プロンプトの構築（回答が「概略」「メニュー」「通販」「その他」のいずれかになるように指示）
        String prompt =
            "あなたは牛タン店の案内アシスタントです。次の問い合わせ内容に最も該当する項目を、" +
            "「概略」「メニュー」「通販」「その他」の4つのうち1つだけ単語で答えてください。余計な説明は書かないでください。\n" +
            "・概略：お店の場所、地図、アクセス、営業時間、定休日など\n" +
            "・メニュー：店頭の定食、単品料理、ドリンクなど\n" +
            "・通販：お取り寄せ、冷凍商品、オンライン販売など\n" +
            "・その他：上記以外\n\n" +
            "問い合わせ内容：" + query;

        // 授業で作った GoogleAIStudioAPI をそのまま呼び出す
        GoogleAIStudioAPI api = new GoogleAIStudioAPI();
        String ans = api.getAnswer(prompt);

        // 回答に応じて該当ページへリダイレクト
        if (ans.contains("概略")) {
            response.sendRedirect("overview.jsp");
        } else if (ans.contains("メニュー")) {
            response.sendRedirect("menu.jsp");
        } else if (ans.contains("通販")) {
            response.sendRedirect("online-shop.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}