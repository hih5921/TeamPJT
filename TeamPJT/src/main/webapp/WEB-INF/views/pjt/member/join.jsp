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
						-<input type="text" name="phone" class="form-control"></td>
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
				<input type="submit" value="가입" class="btn btn-dark" onclick="joinCheck()">
			</form>
			<br><br><br><br>
		</div>
	</section>
	
	<script type ="text/javascript">
	
	function Id_check(){
		
		var id = $("#id").val(); 
		var userID ={"id":id};
		
		$.ajax({
			type: "post",
			url: "checkId",
			data: userID,
			
			error: function(request,error){
				alert(error+ "\n" + request.status)
			}, success: function(result){
				console.log("O (1) X(0) : " +result);
				
				if(result==1){
					alert("존재하는 아이디입니다.");
				}else{
					alert("사용가능한 아이디입니다.");
					$("#id").attr("readonly",true);
				}
			}
			
		});
		console.log(userID);
	}
	
	function joinCheck(){
		
		if (!$("#id").attr("readonly")){
			alert("아이디 중복체크를 하세요.");
		}else if($("#pw").val().length < 1){
			alert("비밀번호를 입력해 주세요");
		}else if($("#pw").val() != $("#pw_check").val()){
			alert("비밀번호를 확인하세요");
			$("#pw_check").focus(); 
		}else if(confirm("회원가입 하시겠습니까?")){
			$("#regForm").submit();
		}
	}

</script>
</body>
<%@include file="../footer.jsp"%>
</html>