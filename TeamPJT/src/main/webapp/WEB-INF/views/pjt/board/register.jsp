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
	<form action="register" id="reg" method="post">
		<div class="container text-center"
			style="background-color: graytext; color: white;">
			<div class="row" style="height: 40px;">
				<input type="text" class="col-9 bg-light" style="border: 2px solid #888;" placeholder="제목" name="board_title"/> 
				<input type="text" class="col-3 bg-light" style="border: 2px solid #888;" placeholder="별점(1~5)" name="board_score"/>
			</div>
			<div class="row">
				<input type="text" class="col bg-light" style="border: 2px solid #888;" placeholder="작성자" name="user_id" />
				<input type="text" class="col bg-light"	style="border: 2px solid #888;"	placeholder="카테고리" name="board_category" /> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	placeholder="조회수"  readonly/> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	placeholder="작성일"  readonly/>
			</div>
		</div>

		<div class="container py-4">

			<!-- p, mb 클래는 마진 관련, bg - 백그라운드, 라운더 - 보더 -->
			<label class="input-file-button" for="input-file">이미지 첨부<input type="file" id="input-file" style="display:none" /></label>
			<textarea class="p-5 mb-4 bg-light rounded-3 w-100" placeholder="내용" name=board_content></textarea>
			
			
			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100" placeholder="장점" name="board_strength"></textarea>
					
				</div>

				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100" placeholder="단점" name="board_weakness"></textarea>
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
	/*댓글 추가*/
	function addReply() {
		var user_id = $('#user_id').val() 
		var reply_coment = $('#reply_coment').val()
		var board_num = ${param.board_num}
		location.href="/replies/addReply?board_num="+board_num+"&user_id="+user_id+"&reply_coment="+reply_coment	 
	}
	
	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e){
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		alert("통과");
	});
	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	
	
	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}
</script>
</body>
</html>
