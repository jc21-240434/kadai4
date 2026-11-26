<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>牛タン処 杜の炭火｜概略</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
  <header class="hero">
    <h1>店舗概略</h1>
    <p>牛タン処 杜の炭火のご案内</p>
    <nav class="nav">
      <a href="${pageContext.request.contextPath}/index.jsp">トップ</a>
      <a href="${pageContext.request.contextPath}/overview.jsp">概略</a>
      <a href="${pageContext.request.contextPath}/menu.jsp">メニュー</a>
      <a href="${pageContext.request.contextPath}/online-shop.jsp">通販</a>
    </nav>
  </header>

  <main class="container">
    <section class="search-box">
      <h2>お問い合わせ・ページ検索</h2>
      <form action="${pageContext.request.contextPath}/search" method="post">
        <input type="text" name="query" placeholder="例：定休日はいつですか？ / メニューを見たい">
        <button type="submit">検索</button>
      </form>
    </section>

    <section class="card">
      <h2>店舗情報</h2>
      <p><strong>店名：</strong>牛タン処 杜の炭火</p>
      <p><strong>住所：</strong>宮城県仙台市青葉区中央1-2-3</p>
      <p><strong>営業時間：</strong>11:00〜21:30（L.O. 21:00）</p>
      <p><strong>定休日：</strong>水曜日</p>
      <p><strong>アクセス：</strong>仙台駅 西口から徒歩5分</p>
      <div style="margin-top: 16px; padding: 16px; background: #faf7f2; border-radius: 8px;">
        <strong>地図（簡易案内）</strong>
        <p style="margin: 8px 0 0;">
          ［仙台駅 西口］ ── 徒歩約5分 ──▶ ［牛タン処 杜の炭火］
        </p>
      </div>
    </section>
  </main>
</body>
</html>
