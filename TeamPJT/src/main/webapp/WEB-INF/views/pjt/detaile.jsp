<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
</head>
<body>
	<br>
	<main>
		<div class="container text-center" 
			style="background-color: graytext; color: white;">
			<div class="row" style="height: 40px; ">
				<input type="text" class="col-9 bg-light" style="border: 2px solid #888;" value="제목 : ${list.board_title}"  readonly/>
				<input type="text" class="col-3 bg-light" style="border: 2px solid #888;" value="별점 : ${list.board_score}"  readonly/>
			</div>
			<div class="row">
			<input type="text" class="col bg-light" style="border: 2px solid #888;" value="작성자 : ${list.user_id}"  readonly/>
			<input type="text" class="col bg-light" style="border: 2px solid #888;" value="카테고리 : ${list.board_category}"  readonly/>
			<input type="text" class="col bg-light" style="border: 2px solid #888;" value="조회수 : ${list.board_view}"  readonly/>
			<input type="text" class="col bg-light" style="border: 2px solid #888;" value="작성일 : ${list.board_date}"  readonly/>
			</div>
		</div>

		<div class="container py-4">
		
			<!-- p, mb 클래는 마진 관련, bg - 백그라운드, 라운더 - 보더 -->
			<textarea class="p-5 mb-4 bg-light rounded-3 w-100"  readonly>${list.board_content}</textarea>
				
			

			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100"  readonly>${list.board_strength}</textarea>
				</div>
				
				<div class="col-md-6">
					<textarea class="h-100 p-5 bg-light rounded-3 w-100" readonly>${list.board_weakness}</textarea>
				</div>
			</div>
			
			<br>
			
			<!-- 댓글처리 -->
			<div class="card card-primary card-outline">
				
				<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
				<div class="card-header">
					<a href="" class="link-black text-lg"><i
						class="fas fa-comments margin-r-5 replyCount"></i></a>
					<div class="card-tools">
						<h4>Comment</h4>
					</div>
				</div>
				<%--댓글 목록--%>
				<div class="card-body repliesDiv"><h4>댓글</h4></div>
				<%--댓글 페이징--%>
				<div class="card-footer">
					<nav aria-label="Contacts Page Navigation">
						<ul
							class="pagination pagination-sm no-margin justify-content-center m-0">
						</ul>
					</nav>
				</div>
			</div>


			<div class="card-body">
				
				<form class="form-horizontal">
					<div class="row">
						<div class="form-group col-sm-8">
							<input class="form-control input-sm" id="newReplyText"
								type="text" placeholder="댓글 입력...">
						</div>
						<div class="form-group col-sm-2">
							<input class="form-control input-sm" id="newReplyWriter"
								type="text" placeholder="작성자">
						</div>
						<div class="form-group col-sm-2">
							<button type="button"
								class="btn btn-s btn-secondary btn-block replyAddBtn">
								<i class="fa fa-save"></i> 저장
							</button>
						</div>
					</div>
				</form>
			</div>


		</div>
			<%@include file="footer.jsp"%>
	</main>


<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 
<script type="text/javascript">
	$(document).redy(function() {
		
	}); -->
	
	

</script>
</body>
</html>
