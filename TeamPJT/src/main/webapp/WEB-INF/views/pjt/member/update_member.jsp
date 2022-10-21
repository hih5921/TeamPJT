<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="../header.jsp"%>
<body>
	<section>
		<div align="center">
			<form name="regform" id="regform" action="update_member_form" method="post">
				<br><br><br>
				<h2>My Page</h2><br>
				<table>
					<tr>
					<!-- 세션받아서 value값 채우기 -->
						<td>ID</td>
						<td><input type="text" name="id" id="id" class="form-control" readonly value="${vo.id}"></td>
					</tr>
					
					<tr>
						<td>PHONE</td>
						<td><input type="text" name="phone" id="phone" value="${vo.phone}" class="form-control"></td>
					</tr>
					<tr>
						<td>ADDRESS</td>
						<td><input type="email" name="address" id="address" value="${vo.address}" class="form-control"></td>
					</tr>
					<tr>
						<td>EMAIL</td>
						<td><input type="text" name="email" id="email" value="${vo.email}" class="form-control"></td>
					</tr>
					<tr>
						<td>NICKNAME </td>
						<td><input type="text" name="nick" id="nick" value="${vo.nick}" class="form-control"></td>
					</tr>
				</table>
				<br><br>
				<input type="button" value="수정" class="btn btn-dark" onclick="updateCheck()">
				<input type="button" value="취소" class="btn btn-secondary" onclick="location.href='mypage'">
			</form>
			<br><br><br><br>
		</div>
	</section>
</body>

	<script type="text/javascript">
		function updateCheck() {			
			if(document.regform.phone.value == ''){
				alert("전화번호를 입력해 주세요");
			}else if (document.regform.address.value == ''){
				alert("주소를 입력해 주세요")
			}else if (document.regform.email.value == ''){
				alert("이메일을 입력해 주세요")
			}else if (document.regform.nick.value == ''){
				alert("닉네임을 입력해 주세요")
			}else if(confirm("수정 하시겠습니까?")){
				document.regform.submit();
			}
		}
	
	
	</script>	
<%@include file="../footer.jsp"%>
</html>