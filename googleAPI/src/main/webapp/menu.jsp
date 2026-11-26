<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>牛タン処 杜の炭火｜メニュー</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
  <header class="hero">
    <h1>店内メニュー</h1>
    <p>炭火で香ばしく焼き上げた牛タン料理</p>
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
        <input type="text" name="query" placeholder="例：営業時間を教えて / 冷凍牛タンの通販はある？">
        <button type="submit">検索</button>
      </form>
    </section>

    <section class="card-grid">
      <div class="card">
        <h3>定食</h3>
        <ul>
          <li>牛タン定食（1.5人前） — 2,380円</li>
          <li>極厚芯たん定食 — 2,680円</li>
          <li>牛タン＆とろろ麦飯定食 — 2,150円</li>
        </ul>
      </div>

      <div class="card">
        <h3>単品</h3>
        <ul>
          <li>炭火焼き牛タン（塩・味噌） — 1,480円</li>
          <li>牛タンつくね — 680円</li>
          <li>テールスープ — 520円</li>
        </ul>
      </div>

      <div class="card">
        <h3>ドリンク</h3>
        <ul>
          <li>生ビール（中） — 620円</li>
          <li>レモンサワー — 520円</li>
          <li>ウーロン茶・緑茶 — 380円</li>
        </ul>
      </div>
    </section>
  </main>
</body>
</html>