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
		<div class="container text-center"
			style="background-color: graytext; color: white; border-collapse:collapse;">
			<div class="row" style="height: 40px;">
				<input type="text" class="col-9 bg-light" style="border: 2px solid #888;" value="제목 : ${list.board_title}" readonly /> 
								<input type="text" class="col-3 bg-light" style="border: 2px solid #888; color: gold;" 
				value="<c:forEach var="a" begin="1" end="${list.board_score }">★</c:forEach>"name="board_score" readonly/>
			</div>
			<div class="row">
				<input type="text" class="col bg-light"	style="border: 2px solid #888;" value="작성자 : ${list.user_id}" readonly /> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;" value="카테고리 : ${list.board_category}" readonly /> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;"	value="조회수 : ${list.board_view}" readonly /> 
				<input type="text" class="col bg-light" style="border: 2px solid #888;" value="작성일 : ${list.board_date}" readonly />
			</div>
		</div>

		<div class="container py-4">

			<!-- p, mb 클래는 마진 관련, bg - 백그라운드, 라운더 - 보더 -->
			<div id="editor" contenteditable="false" class="p-5 mb-4 bg-light rounded-3 w-100" >
				${list.board_content}
				
			</div>



			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100" readonly>${list.board_strength}</textarea>
				</div>

				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100" readonly>${list.board_weakness}</textarea>
				</div>
			</div>
			
			<br><br>
			<!-- 추천 -->
			<div align="center">
				<c:if test="${sessionScope.loginId == null || sessionScope.loginId eq 'guest'}">
				<img src="/resources/img/before_like.png" id="likeimg" width="60px" height="60px" "> 
					${b.like_count} <br><br> 추천 기능은 
					<a href="/member/login" type="button" id="newLogin" class="btn btn-outline-success">로그인</a>
					후 사용 가능합니다.
					</c:if>
					<c:if test="${sessionScope.loginId != null}">
						<div>
					<input type="hidden" id="like_check" value="${like.like_check}">
					<img class="rounded-circle likeimg" id="likeimg" src="/resources/img/like.png" width="60px" height="60px"> ${b.like_count}
					</div>
				</c:if>
			</div>
			
			
			<br>
			<div align="center">
						<button type="button" class="btn btn-secondary" onclick="location.href='modify?board_num=${param.board_num}'">수정</button>
						<button type="button" class="btn btn-secondary" onclick="location.href='delete'">삭제</button>
			</div>
			<div class="my-3 p-3 bg-body rounded shadow-sm">
				<h6 class="border-bottom pb-2 mb-0">댓글</h6>
				<c:forEach var="reply" items="${reply_list}">
					<!-- 반복 -->
					<div class="d-flex text-muted pt-3">
						<svg class="bd-placeholder-img flex-shrink-0 me-2 rounded"
							width="32" height="32" xmlns="http://www.w3.org/2000/svg"
							role="img" aria-label="Placeholder: 32x32"
							preserveAspectRatio="xMidYMid slice" focusable="false">
						<rect width="100%" height="100%" fill="#007bff" />
						<text x="50%" y="50%" fill="#007bff" dy=".3em">32x32</text></svg>

						<div class="pb-3 mb-0 small lh-sm border-bottom w-100">
							<div class="d-flex justify-content-between">
								<strong class="text-gray-dark"> ${reply.user_id} </strong> <a
									href="addReply()" class="small">삭제</a>
							</div>
							<span class="d-block">${reply.reply_coment}</span>
						</div>

					</div>
					
				</c:forEach>
				<!-- 반복 -->

			</div>
			<form class="form-horizontal">
				<div class="row">
					<div class="form-group col-sm-8">
						<input class="form-control input-sm" id="reply_coment" type="text"
							placeholder="댓글 입력...">
					</div>
					<div class="form-group col-sm-2">
						<input class="form-control input-sm" id="user_id" type="text"
							placeholder="작성자">
					</div>
					<div class="form-group col-sm-2">
						<button type="button"
							class="btn btn-s btn-secondary btn-block replyAddBtn"
							onclick="addReply()">
							<i class="fa fa-save"></i> 저장
						</button>
					</div>
				</div>
			</form>
		</div>
		<%@include file="../footer.jsp"%>
	</main>




	<script type="text/javascript">
		function addReply() {
			var user_id = $('#user_id').val()
			var reply_coment = $('#reply_coment').val()
			var board_num = ${param.board_num}
			location.href = "/replies/addReply?board_num=" + board_num
					+ "&user_id=" + user_id + "&reply_coment=" + reply_coment

		}
		
		$(document).ready(function () {
			let like_count = document.getElementById('like_count')
			let likeval = document.getElementById('like_check').value
			const b_number = '${b.b_number}';
			const m_id = "${sessionScope.loginId}";
			const likeimg = document.getElementById("likeimg")

			if (likeval > 0) {
				likeimg.src = "/resources/img/like.png";
			}
			else {
				likeimg.src = "/resources/img/before_like.png";
			}
		    // 좋아요 버튼을 클릭 시 실행되는 코드

		$(".likeimg").on("click", function () {
			$.ajax({
		      url: '/board/like',
		      type: 'POST',
		      data: { 'b_number': b_number, 'm_id': m_id },
		      success: function (data) {
		          if (data == 1) {
		              $("#likeimg").attr("src", "/resources/img/like.png");
		              location.reload();
		          } else {
		              $("#likeimg").attr("src", "/resources/img/before_like.png");
		              location.reload();
		          }
		      }, error: function () {
		          $("#likeimg").attr("src", "/resources/img/like.png");
		      }

		  });

		  });
		  });
		
		
	</script>
</body>
</html>
