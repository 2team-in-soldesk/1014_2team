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


<script type="text/javascript">
window.onload=function(){
 	var star=document.getElementsByClassName("star");
	
	if(${commentbean.t_com_score } >0){
		for(var i=0;i<star.length;i++){
	        if(i<${commentbean.t_com_score}){
	            star[i].innerHTML='★';
	        }else{
	            star[i].innerHTML='☆';
	        }
	    }
	} 
}


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

</script>

<form name="form" action="${root }comment/com_updatepass" method="post">
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

<input type="hidden" name="t_com_score" value="${commentbean.t_com_score }">
<br>
후기 <br>
<textarea name="t_com_com" rows="5" cols="10" >${commentbean.t_com_com }</textarea>
<input type="hidden" name="t_no" value="${t_no}">
<input type="hidden" name="t_com_no" value="${commentbean.t_com_no }">

<input type="submit" value="작성">

</form>

</body>
</html>