<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>牛タン処 杜の炭火｜トップページ</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
  <header class="hero">
    <h1>牛タン処 杜の炭火</h1>
    <p>厚切り牛タンと麦飯・テールスープの専門店</p>
    <nav class="nav">
      <a href="${pageContext.request.contextPath}/index.jsp">トップ</a>
      <a href="${pageContext.request.contextPath}/overview.jsp">概略</a>
      <a href="${pageContext.request.contextPath}/menu.jsp">メニュー</a>
      <a href="${pageContext.request.contextPath}/online-shop.jsp">通販</a>
    </nav>
  </header>

  <main class="container">
    <section class="search-box">
      <h2>ご用件をお聞かせください</h2>
      <form action="${pageContext.request.contextPath}/search" method="post">
        <input type="text" name="query" placeholder="例：営業時間は？ / 定食メニューを見たい / お取り寄せしたい">
        <button type="submit">検索</button>
      </form>
    </section>

    <section class="card-grid">
      <a class="card" href="${pageContext.request.contextPath}/overview.jsp">
        <h3>概略</h3>
        <p>所在地・地図・営業時間・定休日</p>
      </a>
      <a class="card" href="${pageContext.request.contextPath}/menu.jsp">
        <h3>メニュー</h3>
        <p>牛タン定食・単品・ドリンク</p>
      </a>
      <a class="card" href="${pageContext.request.contextPath}/online-shop.jsp">
        <h3>通販</h3>
        <p>ご自宅用・ギフト向け牛タン商品</p>
      </a>
    </section>
  </main>
</body>
</html>