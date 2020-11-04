<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<!----------------- 세부검색 체크박스 ------------------------>
<form action="${root }toilet/list" method="get">
<input type="checkbox" onclick="t_sebu1(this)" name="mwm" value="N" >남녀분리형
<input type="checkbox" onclick="t_sebu2(this)" name="child" value="1">어린이용포함
<input type="checkbox" onclick="t_sebu3(this)" name="handicap" value="1">장애인용포함
<input type="hidden" name="searchKey" value="${searchKey }">
<input type="hidden" name="t_user_id" value="${t_user_id }">
<input type="hidden" name="current_page_num" value="1">
<input type="submit" value="상세조회">
</form>


<!----------------- 검색결과 없을 경우 ------------------------>

<c:if test="${empty li }">
검색결과 없음
</c:if>


<!----------------- 검색결과 있을 경우 ------------------------>
<c:if test="${not empty li }">

	<!-------------- 남녀분리만 체크시 -------------------------->
	<c:if test="${mwm eq 'N' && handicap==0 && child ==0}">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${t.t_mwm eq 'N' }">
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	<!-------------- 장애인만 체크시 -------------------------->
	<c:if test="${mwm eq 'Y' && handicap>0 && child ==0}">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${(t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap }">
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	<!-------------- 어린이만 체크시 -------------------------->
	<c:if test="${mwm eq 'Y' && handicap==0 && child >0 }">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${(t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	<!-------------- 남녀분리, 장애인 체크시 -------------------------->
	<c:if test="${mwm eq 'N' && handicap >0  && child ==0 }">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${t.t_mwm eq 'N' &&
	(t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap }">
	
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	<!-------------- 남녀분리, 어린이용 체크시 -------------------------->
	<c:if test="${mwm eq 'N' && handicap ==0  && child >0 }">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${t.t_mwm eq 'N' &&
	(t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
	
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	<!-------------- 장애인, 어린이용 체크시 -------------------------->
	<c:if test="${mwm eq 'Y' && handicap >0  && child >0 }">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${(t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap &&
	(t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
	
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	
	<!-------------- 모두 체크시 -------------------------->
	<c:if test="${mwm eq 'N' && handicap >0  && child >0 }">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	<c:choose>
	<c:when test="${t.t_mwm eq 'N' &&
	(t.t_hml_number+t.t_hms_number+t.t_hwml_number) >= handicap &&
	(t.t_hwms_number+t.t_cms_number+t.t_cml_number) >= child }">
	
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	
	</c:when>
	</c:choose>
	</c:forEach>
	</c:if>
	
	<!-------------- 모두 체크 안되어있을경우 -------------------------->
	<c:if test="${child ==0 && handicap ==0 && mwm eq 'Y'}">
	<c:forEach var="t" items="${li }" begin="${pagenumbean.for_start_num }" end="${pagenumbean.for_end_num -1}">
	
	<a href="${root }toilet/detail?t_no=${t.t_no}&t_user_id=${t_user_id}">
	${t.t_no }  ${t.t_name} ${t.t_nm_name } </a><br>
	
	</c:forEach>
	</c:if>
	
	<br>
	
	<!-------- 페이지 번호 ----------------------->
	<a href="${root }toilet/list?current_page_num=${pagenumbean.page_start }&
	searchKey=${searchKey}&
	t_user_id=${t_user_id}&
	mwm=${mwm}&
	child=${child}&
	handicap=${handicap}"
	style="text-decoration:none;"
	>첫페이지</a>
	
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<c:forEach var="idx" begin="${pagenumbean.page_num_min }" end="${pagenumbean.page_num_max }" varStatus="status">
	
	<a href="${root }toilet/list?current_page_num=${status.index }&
	searchKey=${searchKey}&
	t_user_id=${t_user_id}&
	mwm=${mwm}&
	child=${child}&
	handicap=${handicap}"
	style="text-decoration:none;"
	class="page"
	>${status.index }</a>
	
	</c:forEach>
	
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href="${root }toilet/list?current_page_num=${pagenumbean.page_end }&
	searchKey=${searchKey}&
	t_user_id=${t_user_id}&
	mwm=${mwm}&
	child=${child}&
	handicap=${handicap}"
	style="text-decoration:none;"
	>끝페이지</a>
	
	<br>

</c:if>

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

</script>

</body>
</html>