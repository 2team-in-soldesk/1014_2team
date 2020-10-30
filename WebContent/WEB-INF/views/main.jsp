<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>



<a href="${root }user/join">가입</a><br>
<a href="${root }user/select">회원조회</a><br>

<form action="${root }toilet/list" method="get">
<input name="searchKey">
<input type="submit" value="화장실검색">
</form>



</body>
</html>