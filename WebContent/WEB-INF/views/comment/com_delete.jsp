<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
var con=confirm("후기를 삭제하시겠습니까?");

if(con==true){
	location.href="${root}comment/com_deletepass?t_user_id=${t_user_id}&t_com_no=${t_com_no}&t_no=${t_no}";
}else{
	location.href="${root}comment/commentlist?t_user_id=${t_user_id}&t_com_no=${t_com_no}&t_no=${t_no}";
}
</script>

</body>
</html>