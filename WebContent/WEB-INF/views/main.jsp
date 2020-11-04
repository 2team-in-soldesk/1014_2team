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

<script type="text/javascript">
window.onload=function(){
	var id=document.form.t_user_id;
	var login=document.getElementById("login");
	if(id.value.length>=2){
		login.innerHTML="로그아웃";
		login.href="${root}user/logout";
	}
}
</script>


<a href="${root }user/join">가입</a><br>
<a href="${root }user/select">회원조회</a><br>
<a id="login" href="${root }user/login">로그인</a><br>

<form name="form" action="${root }toilet/list" method="get">
<input name="searchKey">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="submit" value="화장실검색">
</form>



</body>
</html>