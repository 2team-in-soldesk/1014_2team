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
�α���������
<form name="form" action="${root }user/loginpass" method="post">
���̵� <input name="t_user_id">
��� <input name="t_user_pw">
<br>
<input type="submit" value="�α���">
<input type="button" value="ȸ������" onclick="location.href='${root}user/join'">
<input type="button" value="����" onclick="location.href='${root}main'">
</form>
</body>
</html>