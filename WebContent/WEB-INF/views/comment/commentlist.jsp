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


<c:forEach var="c" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
<img src="${root }img/${c.t_com_profileimg }.jpg" 
alt="${c.t_com_profileimg }" width="50" height="50">
${c.t_com_no} / ${c.t_user_id } / ${c.t_com_score } /
${c.t_com_com } /
${c.t_com_date }/ ${t_no }

<!-------로그인한 아이디가 작성한 코멘트만 수정 삭제 버튼 보이게 설정--------->
<c:if test="${t_user_id eq c.t_user_id}">

<button onclick="location.href='${root}comment/com_update?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${t_no }'">코멘트수정</button>
<button onclick="location.href='${root}comment/com_delete?t_user_id=${c.t_user_id}&t_com_no=${c.t_com_no }&t_no=${t_no }'">코멘트삭제</button>

</c:if>

<br>
</c:forEach>

<!-------- 페이지 번호 ----------------------->

<a href="${root }comment/commentlist?current_page_num=${pagenumbean.page_start }&t_no=${t_no}"
style="text-decoration:none;"
>첫페이지</a>

&nbsp;&nbsp;&nbsp;&nbsp;

<c:forEach begin="1" end="${pagenumbean.page_count }" varStatus="status">
<a href="${root }comment/commentlist?current_page_num=${status.count }&
t_no=${t_no}"
style="text-decoration:none;"
class="page"
>${status.count }</a>
</c:forEach>


&nbsp;&nbsp;&nbsp;&nbsp;

<a href="${root }comment/commentlist?current_page_num=${pagenumbean.page_end }&t_no=${t_no}"
style="text-decoration:none;"
>끝페이지</a>



<script type="text/javascript">
var page=document.getElementsByClassName("page");

var c=${pagenumbean.current_page_num};
for(var i=0;i<page.length;i++){
	var pagenum=parseInt(page[i].innerHTML);
	if(pagenum==c){
		page[i].style.color="red";
		page[i].style.fontWeight="bold";
	}else{
		page[i].style.color="black";
		page[i].style.fontWeight="normal";
	}

}


// 코멘트 삭제 함수. true이면 삭제실행
/* function del(a){
	var con=confirm("후기를 삭제하시겠습니까?");
	
	if(con==true){
		location.href="${root}comment/com_delete?t_user_id=${c.t_user_id} ";
	}
} */

</script>


</body>
</html>