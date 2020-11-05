<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>토일렛33</title>
</head>
<body>

<script type="text/javascript">

// 로그인 되면 로그아웃으로 바꿔줌
window.onload=function(){
	var id=document.form.t_user_id;
	var login=document.getElementById("login");
	if(id.value.length>=2){
		login.innerHTML="로그아웃";
		login.href="${root}user/logout";
	}
}



</script>

<c:if test="${t_user_id eq null }">

<a href="${root }user/join">가입</a><br>
<a href="${root }user/select">회원조회</a><br>
<a id="login" href="${root }user/login">로그인</a><br>



<form name="form" action="${root }toilet/list" method="get">
<input name="searchKey">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="submit" value="화장실검색">
</form>

</c:if>

<!----------- 로그인 하면 뜨는 링크------------->
<c:if test="${not empty t_user_id}">

<a href="${root }user/user_update?t_user_id=${t_user_id}">정보수정</a><br>
<a href="${root }user/user_delete?t_user_id=${t_user_id}">탈퇴</a><br>

<form name="form" action="${root }toilet/list" method="get">
<input name="searchKey">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="submit" value="화장실검색">
</form>

</c:if>

</body>
</html>