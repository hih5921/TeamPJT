<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>
<head>
</head>
<body>
	<br>
	<main>
	<form action="modify" id="reg" method="post">
		<div class="container text-center"
			style="background-color: graytext; color: white;">
			<div class="row" style="height: 40px;">
				
				<input type="text" class="col-9 bg-light" style="border: 2px solid #888;" value="${list.board_title}" name="board_title"/> 
				<input type="text" class="col-3 bg-light" style="border: 2px solid #888;" value="${list.board_score}" name="board_score"/>
			</div>
			<div class="row">
				<input type="text" class="col bg-light" style="border: 2px solid #888;" value="${list.user_id}" name="user_id" />
				<input type="text" class="col bg-light"	style="border: 2px solid #888;"	value="${list.board_category}" name="board_category" /> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	value="${list.board_view}"  readonly/> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	value="${list.board_date}"  readonly/>
				<input type="hidden" name ="board_num" value="${list.board_num}"/>
			</div>
		</div>

		<div class="container py-4">

			<!-- p, mb 클래는 마진 관련, bg - 백그라운드, 라운더 - 보더 -->
			<label class="input-file-button" for="input-file">이미지 첨부<input type="file" id="input-file" style="display:none"/></label>
			<textarea class="p-5 mb-4 bg-light rounded-3 w-100" placeholder="내용" name=board_content>${list.board_content}</textarea>



			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"  name="board_strength">${list.board_strength}</textarea>
				</div>

				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"  name="board_weakness">${list.board_weakness}</textarea>
				</div>
			</div>

			<br>
			
		<div align="center">
			<button type="submit" class="btn btn-secondary">등록</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='list'">취소</button>
		</div>
			
		</div>
		</form>
		<%@include file="../footer.jsp"%>
	</main>


	<!-- jQuery -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	
<script type="text/javascript">

</script>
</body>
</html>
