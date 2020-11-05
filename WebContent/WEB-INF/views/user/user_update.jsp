<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form:form modelAttribute="userbean" action="${root }user/user_update" method="post">
이름 : ${ t_user_name }
<br>
ID : <form:input path="t_user_id" readonly/>
<br>
PW : <form:input path="t_user_pw"/>
<form:errors path="t_user_pw"/>
<br>
PW확인 : <form:input path="t_user_pw2"/>
<form:errors path="t_user_pw2"/>
<br>
메일 : <form:input path="t_user_email"/>
<form:errors path="t_user_email"/>
<br>
전화 : <form:input path="t_user_tel"/>
<form:errors path="t_user_tel"/>
<br>
<form:button>수정</form:button>
</form:form>

</body>
</html>