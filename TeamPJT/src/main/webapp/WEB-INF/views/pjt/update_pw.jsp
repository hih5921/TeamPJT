<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<body>
	<section>
		<div align="center">
			<form name="regform" action="update_member_ok" method="post">
				<br><br><br>
				<h2>My Page</h2><br>
				<table>
					<tr>
						<td>기존 비밀번호</td>
						<td><input type="password" name="pw" class="form-control"></td>
					</tr>
					<tr>
						<td>변경 비밀번호</td>
						<td><input type="password" name="newpw" class="form-control"></td>
					</tr>
					<tr>
						<td>변경 비밀번호 확인</td>
						<td><input type="password" name="newpwcheck" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="변경" class="btn btn-dark" onclick="check()">
				<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='mypage'">
			</form>
			<br><br><br><br>
		</div>
	
	
	</section>
</body>
<%@include file="footer.jsp"%>
</html>