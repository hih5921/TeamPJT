<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- SimpleDateFormat --%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Header가 아래 Style sheet때문에 문제 발생 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
.row {
	margin: 0px auto;
	width: 900px;
}

h1 {
	text-align: center;
}
</script>
</style>

<body>
	<div class="container">
		<div class="row">
			<h1>전체 게시판</h1>
			<table class="table">
				<tr>
				 	<button type="button" class="btn btn-primary btn-sm float-right" onclick="">글쓰기</button>	
				</tr>
			</table>
				<table class="table table-striped">
				<tr class="danger">
					<th class="text-center" width=5%>글번호</th>
					<th class="text-center" width=10%>카테고리</th>
					<th class="text-center" width=15%>제목</th>
					<th class="text-center" width=25%>내용</th>
					<th class="text-center" width=10%>작성일</th>
					<th class="text-center" width=5%>평점</th>
					<th class="text-center" width=10%>조회수</th>
					<th class="text-center" width=5%>추천</th>
					<th class="text-center" width=10%>아이디</th>					
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td class="text-center" width=5%>번호</td>
						<td class="text-center" width=10%>카테고리</td>
						<td class="text-center" width=15%>제목<a href="="></a></td>
						<td class="text-center" width=25%>내용</td>
						<td class="text-center" width=10%>
						<fmt:formatDate	value="${vo.regdate }" pattern="yyyy-MM-dd" /></td>
						<td class="text-center" width=5%>평점</td>
						<td class="text-center" width=10%>조회수</td>
						<td class="text-center" width=5%>추천</td>
						<td class="text-center" width=10%>아이디</td>
					</tr>
				</c:forEach>
			</table>
			<table class="table">
				<td class="text-center"><a href="#"
					class="btn btn-sm btn-primary">이전</a> ${curpage } page /
					${totalpage } pages <a href="#" class="btn btn-sm btn-primary">다음</a>
				</td>
			</table>
		</div>
	</div>

<%@include file="footer.jsp"%>
</body>
</html>