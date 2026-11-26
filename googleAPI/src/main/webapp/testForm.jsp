<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String question = (String) request.getAttribute("QUESTION");
	String ans = (String) request.getAttribute("ANS");
%>
	<p>質問: <%=question %></p>
	<p>解答: <%=ans %></p>
</body>
</html>