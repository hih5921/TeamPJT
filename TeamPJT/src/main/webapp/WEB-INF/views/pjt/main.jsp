<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="header.jsp"%>
<!-- Page Content-->
<div class="container px-4 px-lg-5">
	<!-- Heading Row-->
	<div class="row gx-4 gx-lg-5 align-items-center my-5">
		<div class="col-lg-7">
			<img class="img-fluid rounded mb-4 mb-lg-0"
				src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." />
		</div>
		<div class="col-lg-5">
			<h1 class="font-weight-light">전체 게시물 조회수 top</h1>
			<p>조회수 top 게시물 본문 내용</p>
			<a class="btn btn-primary" href="#!">더보기</a>
		</div>
	</div>
	<!-- Call to Action-->
	<div class="card text-white bg-secondary my-5 py-4 text-center">
		<div class="card-body">
			<p class="text-white m-0">조회수 Ranking Top4.</p>
		</div>
	</div>
	<!-- Content Row-->

	<div class="row gx-4 gx-lg-5">
		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/image-5.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					<p class="card-text">간단한 내용</p>
					<a href="#" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>

		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/image-5.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					<p class="card-text">간단한 내용</p>
					<a href="#" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>


		<div class="col-md-4 mb-5">
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/image-5.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">제목</h5>
					<p class="card-text">간단한 내용</p>
					<a href="#" class="btn btn-primary">더보기</a>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="footer.jsp"%>
</body>
</html>