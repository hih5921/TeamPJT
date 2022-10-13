<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form name="regform" action="delete_ok.jsp" method="post">
				<br><br><br>
				<h2>My Page</h2><br>
				<table>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pwcheck" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="회원탈퇴" class="btn btn-dark" onclick="check()">
				<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='mypage'">
			</form>
			<br><br><br><br>
		</div>
	
	
	</section>
</body>
<%@include file="../footer.jsp"%>
</html>