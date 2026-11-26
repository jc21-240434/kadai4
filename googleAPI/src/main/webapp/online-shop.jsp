<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>牛タン処 杜の炭火｜通販</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
  <header class="hero">
    <h1>オンライン通販</h1>
    <p>ご自宅でもお店の牛タンをお楽しみいただけます</p>
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
        <input type="text" name="query" placeholder="例：お店の場所を知りたい / 定食の値段は？">
        <button type="submit">検索</button>
      </form>
    </section>

    <section class="card-grid">
      <div class="card">
        <h3>厚切り塩牛タン（300g・冷凍）</h3>
        <p>熟成牛タンを厚切りにし、特製塩ダレで味付けしました。</p>
        <p><strong>価格：</strong>3,200円（税込）</p>
      </div>

      <div class="card">
        <h3>熟成味噌牛タン（300g・冷凍）</h3>
        <p>コクのある仙台味噌ダレに漬け込んだ人気商品です。</p>
        <p><strong>価格：</strong>3,300円（税込）</p>
      </div>

      <div class="card">
        <h3>牛タンしぐれ煮（150g・常温）</h3>
        <p>ご飯のお供やお酒のおつまみにぴったりな牛タン佃煮です。</p>
        <p><strong>価格：</strong>1,180円（税込）</p>
      </div>
    </section>
  </main>
</body>
</html>
