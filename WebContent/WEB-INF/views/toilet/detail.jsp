<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style type="text/css">
.star{ cursor: pointer; }
</style>

<script type="text/javascript">

function star(a){
    var star=document.getElementsByClassName("star");
    for(var i=0;i<star.length;i++){
        if(i<a){
            star[i].innerHTML='★';
        }else{
            star[i].innerHTML='☆';
        }
    }
    document.form.t_com_score.value=a;
}

function ch(){
	var com=document.form.t_com_com;
	var score=document.form.t_com_score;
	var id=document.form.t_user_id;
	if(id.value.length<2){
		var log=confirm("로그인 후 작성 가능합니다. 로그인 하시겠습니까?")
		if(log==true){
			location.href="${root}user/login";
		}
		return false;
	}else if(com.value==""){
		alert("내용을 입력해주세요");
		return false;
	
	}else if(score.value==0){
		alert("별점을 선택해주세요");
		return false;
	}
		
	return true;
}
</script>

</head>
<body>

${requestScope.oneToilet.t_no }
${requestScope.oneToilet.t_name }
<br>

<form name="form" action="${root }comment/add_comment" method="post">
프로필이미지선택
<img alt="a" src="${root }img/1.jpg" width="50" height="50">
<input type="radio" name="t_com_profileimg" value="1" checked>
<img alt="b" src="${root }img/2.jpg" width="50" height="50">
<input type="radio" name="t_com_profileimg" value="2">
<img alt="c" src="${root }img/3.jpg" width="50" height="50">
<input type="radio" name="t_com_profileimg" value="3">
<img alt="d" src="${root }img/4.jpg" width="50" height="50">
<input type="radio" name="t_com_profileimg" value="4">
<br>
별점 
<span class="star" onclick="star(1)">☆</span>
<span class="star" onclick="star(2)">☆</span>
<span class="star" onclick="star(3)">☆</span>
<span class="star" onclick="star(4)">☆</span>
<span class="star" onclick="star(5)">☆</span>

<input type="hidden" name="t_com_score" value="0">
<br>
후기 <br>
<textarea name="t_com_com" rows="5" cols="10"></textarea>
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="hidden" name="t_no" value="${oneToilet.t_no }">
<input type="submit" value="작성" onclick="return ch()">

</form>

<a href="${root }comment/commentlist?t_no=${oneToilet.t_no}">후기더보기</a>

</body>
</html>