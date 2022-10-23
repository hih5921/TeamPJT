<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<%@include file="../header.jsp"%>

<br>
<main>
	<form action="register" id="reg" method="post"
		enctype="multipart/form-data" onsubmit="hiddenValue();">
		<div class="container text-center"
			style="background-color: graytext; color: white;">
			<div class="row" style="height: 40px;">
				<input type="text" class="col-9 bg-light"
					style="border: 2px solid #888;" placeholder="제목" name="board_title" />
				<input type="text" class="col-3 bg-light"
					style="border: 2px solid #888;" placeholder="별점(1~5)"
					name="board_score" />
			</div>
			<div class="row">
				<input type="text" class="col bg-light"
					style="border: 2px solid #888;" placeholder="작성자" name="user_id" />
				<input type="text" class="col bg-light"
					style="border: 2px solid #888;" placeholder="카테고리"
					name="board_category" /> <input type="text" class="col bg-light"
					style="border: 2px solid #888;" placeholder="조회수" readonly /> <input
					type="text" class="col bg-light" style="border: 2px solid #888;"
					placeholder="작성일" readonly />
			</div>
		</div>

		<div class="container py-4">

			<!-- p, mb 클래는 마진 관련, bg - 백그라운드, 라운더 - 보더 -->
			
			<!-- 
			<textarea class="p-5 mb-4 bg-light rounded-3 w-100" placeholder="내용" name=board_content></textarea>
			 -->
			<div class="editor-menu">
				<button type="button" id="btn-bold">
					<b>B</b>
				</button>
				<button type="button" id="btn-italic">
					<i>I</i>
				</button>
				<button type="button" id="btn-underline">
					<u>U</u>
				</button>
				<button type="button" id="btn-strike">
					<s>S</s>
				</button>
				<button type="button" id="btn-ordered-list">OL</button>
				<button type="button" id="btn-unordered-list">UL</button>
				<label class="input-file-button" for="input-file">이미지 첨부<input
				type="file" id="input-file" style="display: none" name="uploadFile" /></label>
			</div>
			<div id="editor" contenteditable="true" class="p-5 mb-4 bg-light rounded-3 w-100" >
				
				
			</div>
			<input type="hidden" name="board_content" value="" >

			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"
						placeholder="장점" name="board_strength"></textarea>
				</div>

				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"
						placeholder="단점" name="board_weakness"></textarea>
				</div>
			</div>

			<br>

			<div align="center">
				<button type="submit" class="btn btn-secondary">등록</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href='list'">취소</button>
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
		let user_id = $('#user_id').val()
		let reply_coment = $('#reply_coment').val()
		let board_num = ${param.board_num}
		location.href = "/replies/addReply?board_num=" + board_num
				+ "&user_id=" + user_id + "&reply_coment=" + reply_coment
	}
	
	//div 텍스트 hidden으로 넘기기
	<!--
	$(function() {
		$("submit").click(function(){
			console.log("실행")
			let innerText = document.getElementById("editor").innerHTML
			$('input[name=board_content]').attr('value',innerText);
			
		})
		
	})
		-->
	function hiddenValue() {
		console.log("실행")
		let innerText = document.getElementById("editor").innerHTML
		$('input[name=board_content]').attr('value',innerText);
	}

	/* 이미지 업로드 */
	$("input[type='file']").on("change", function(e) {
		let formData = new FormData();
		let fileInput = $('input[name="uploadFile"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];

		if (!fileCheck(fileObj.name, fileObj.size)) {
			return false;
		}

		formData.append("uploadFile", fileObj);

		$.ajax({
			url : '/board/uploadFile',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType : 'json',
			success: function(result) {
				showUploadImage(result)
			},
			error : function(result) {
				alert("이미지 파일이 아닙니다.");
			}
		});

	});

	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	

	function fileCheck(fileName, fileSize) {

		if(!regex.test(fileName)){
			console.log(fileName)
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}

		return true;

	}
	//이미지 출력
	function showUploadImage(uploadResultArr){
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = $("#editor");
		let obj = uploadResultArr[0];
		let str = "";
		let fileCallPath = obj.img_uploadPath.replace(/\\/g, '/') + "/s_" + obj.img_uuid + "_" + obj.img_fileName;
		
		
		str += "<img src='/board/display?filename=" + fileCallPath +"'>";
		str += "<input type='hidden' name='imageList[0].img_fileName' value='"+ obj.img_fileName +"'>";
		str += "<input type='hidden' name='imageList[0].img_uuid' value='"+ obj.img_uuid +"'>";
		str += "<input type='hidden' name='imageList[0].img_uploadPath' value='"+ obj.img_uploadPath +"'>";		
		
   		uploadResult.append(str);   
	}
	 
</script>

<script type="text/javascript">

	// 에디터 버튼     
    const editor = document.getElementById('editor');
    const btnBold = document.getElementById('btn-bold');
    const btnItalic = document.getElementById('btn-italic');
    const btnUnderline = document.getElementById('btn-underline');
    const btnStrike = document.getElementById('btn-strike');
    const btnOrderedList = document.getElementById('btn-ordered-list');
    const btnUnorderedList = document.getElementById('btn-unordered-list');

    btnBold.addEventListener('click', function () {
        setStyle('bold');
    });

    btnItalic.addEventListener('click', function () {
        setStyle('italic');
    });

    btnUnderline.addEventListener('click', function () {
        setStyle('underline');
    });

    btnStrike.addEventListener('click', function () {
        setStyle('strikeThrough')
    });

    btnOrderedList.addEventListener('click', function () {
        setStyle('insertOrderedList');
    });

    btnUnorderedList.addEventListener('click', function () {
        setStyle('insertUnorderedList');
    });

    function setStyle(style) {
        document.execCommand(style);
        focusEditor();
    }

    // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
    function focusEditor() {
        editor.focus({preventScroll: true});
    }
    

    

   
</script>


</body>
</html>
