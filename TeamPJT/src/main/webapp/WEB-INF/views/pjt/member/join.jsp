<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form action="join_ok" method="post">
				<br><br>
				<h2>JOIN</h2><br>
				<table>
					<tr>
						<td>ID</td>
						<td><input type="text" name="id" class="form-control"></td>
						<td><input type="button" value="check" class="btn btn-dark" onclick="Id_check()"></td>
					</tr>
					<tr>
						<td>PW</td>
						<td><input type="password" name="pw" class="form-control"></td>
					</tr>
					<tr>
						<td>PW_CHECK</td>
						<td><input type="password" name="pw_check" class="form-control"></td>
					</tr>
					<tr>
						<td>PHONE</td>
						<td>
						<select name="phone1">
						<option>010</option>
						<option>011</option>
						</select>
						-<input type="text" name="phone2" class="form-control"></td>
					</tr>
					<tr>
						<td>ADDRESS</td>
						<td><input type="email" name="email" class="form-control"></td>
					</tr>
					<tr>
						<td>EMAIL</td>
						<td><input type="text" name="address" class="form-control"></td>
					</tr>
					<tr>
						<td>NICKNAME </td>
						<td><input type="text" name="nickname" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="submit" value="가입" class="btn btn-dark">
			</form>
			<br><br><br><br>
		</div>
	</section>
</body>
<%@include file="../footer.jsp"%>
</html>