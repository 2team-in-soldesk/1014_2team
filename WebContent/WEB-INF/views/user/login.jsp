<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
로그인페이지
<form name="form" action="${root }user/loginpass" method="post">
아이디 <input name="t_user_id">
비번 <input name="t_user_pw">
<br>
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='${root}user/join'">
<input type="button" value="메인" onclick="location.href='${root}main'">
</form>
</body>
</html>