<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<form:form modelAttribute="userbean" action="${root }user/joinpass" method="post">
이름 : <form:input path="t_user_name"/>
<form:errors path="t_user_name"/>
<br>
ID : <form:input path="t_user_id"/>
<form:errors path="t_user_id"/>
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
<form:button>가입</form:button>
</form:form>

</body>
</html>