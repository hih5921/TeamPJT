<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="col-9" style="border: 2px solid #888;">제목(댓글수)</div>
				<div class="col-3" style="border: 2px solid #888;">평점</div>
			</div>
			<div class="row">
				<div class="col" style="border: 2px solid #888;">작성자</div>
				<div class="col" style="border: 2px solid #888;">카테고리</div>
				<div class="col" style="border: 2px solid #888;">조회수</div>
				<div class="col" style="border: 2px solid #888;">작성일</div>
			</div>
		</div>

		<div class="container py-4">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">본문 내용</h1>
					<p class="col-md-8 fs-4">본문내용 및 이미지
				</div>
			</div>

			<div class="row align-items-md-stretch">
				<div class="col-md-6">
					<div class="h-100 p-5 bg-light border rounded-3">
						<h2>장점</h2>
						<p>장점 내용
					</div>
				</div>
				<div class="col-md-6">
					<div class="h-100 p-5 bg-light border rounded-3">
						<h2>단점</h2>
						<p>단점내용
					</div>
				</div>
			</div>

			<br>
			<div class="card card-primary card-outline">
				<%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
				<div class="card-header">
					<a href="" class="link-black text-lg">O<i
						class="fas fa-comments margin-r-5 replyCount"></i></a>
					<div class="card-tools">
						<button type="button" class="btn primary" data-widget="collapse">
							<i class="fa fa-plus"></i>
						</button>
					</div>
				</div>
				<%--댓글 목록--%>
				<div class="card-body repliesDiv"></div>
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
						<div class="form-group col-sm-10">
							<input class="form-control input-sm" id="newReplyText"
								type="text" placeholder="댓글 입력...">
						</div>
						<div class="form-group col-sm-2">
							<button type="button"
								class="btn btn-primary btn-sm btn-block replyAddBtn">
								<i class="fa fa-save"></i> 저장
							</button>
						</div>
					</div>
				</form>
			</div>
	</div>
			<%@include file="footer.jsp"%>
	</main>



</body>
</html>
