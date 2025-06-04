<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 도서 상세 정보 데이터를 불러오기 위한 -->
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>
<jsp:useBean id="articleDAO" class="dao.ArticleRepository" scope="session"/>

<!-- 예외처리 -->
<%@ page errorPage="exceptionNoArticleId.jsp" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<!-- css파일 -->
<link rel="stylesheet" type="text/css" href="./resources/css/article.css">

</head>
<body>
	
	<jsp:include page="/layout/header.jsp" />
	
	<main class="container">
		<!-- 게시글 상세 보기 데이터 -->
		<% 
			String id = request.getParameter("id");
			ArticleRepository dao= ArticleRepository.getInstance();//새로 쓴 게시글 가져오기
			Article article=dao.getArticleById(id); //여기 임시 아이디 고정
		%>
		<div class="row g-5">
			<div class="col-md-8">
				<!-- 게시글 본문 -->
				<article class="blog-post">
					<img src="./resources/images/<%=article.getFilename() %>" style="width:100%; height:100%"/>
					<hr>
					<h2 class="display-5 link-body-emphasis mb-1"><%=article.getTitle() %></h2>
					<p class="blog-post-meta">
						January 1, 2021 | <a href="#"><%=article.getUser() %></a>  <!-- 사용자 링크 -->
					</p>
					<p><%=article.getDescription() %></p>
					<p> 여기 사진 기능 / 음식 단계별 기능 / 필요 요리 재료 / 태그 등 추가
					
					<h3>난이도/필요재료/뭐 기타 등등</h3>
					<p>And don't forget about tables in these posts:</p>
					<table class="table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Upvotes</th>
								<th>Downvotes</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Alice</td>
								<td>10</td>
								<td>11</td>
							</tr>
							<tr>
								<td>Bob</td>
								<td>4</td>
								<td>3</td>
							</tr>
							<tr>
								<td>Charlie</td>
								<td>7</td>
								<td>9</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td>Totals</td>
								<td>21</td>
								<td>23</td>
							</tr>
						</tfoot>
					</table>
					
					<hr>
					<p>This is some additional paragraph placeholder content. It
						has been written to fill the available space and show how a longer
						snippet of text affects the surrounding content. We'll repeat it
						often to keep the demonstration flowing, so be on the lookout for
						this exact same string of text.</p>
					
					<!-- -->
				</article>
				
				<nav class="blog-pagination" aria-label="Pagination">
					<a class="btn btn-outline-primary rounded-pill" href="#">Older</a>
					<a class="btn btn-outline-secondary rounded-pill disabled"
						aria-disabled="true">Newer</a>
				</nav>
			</div>
			
			
			<!-- 옆에 서브 테이블 -->
			<div class="col-md-4">
				<div class="position-sticky" style="top: 2rem;">
				
				<!-- 작성자에 대한 정보 -->
					<div class="p-4 mb-3 bg-body-tertiary rounded">
						<h4 class="fst-italic">작성자</h4>
						<p class="mb-0">Customize this section to tell your visitors a
							little bit about your publication, writers, content, or something
							else entirely. Totally up to you.</p>
					</div>
					<!-- 관련한 게시글 -->
					<div>					
						<h4 class="fst-italic">관련 게시글</h4>
						<ul class="list-unstyled">
							<li><a
								class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top"
								href="#"> <svg aria-hidden="true"
										class="bd-placeholder-img " height="96"
										preserveAspectRatio="xMidYMid slice" width="100%"
										xmlns="http://www.w3.org/2000/svg">
										<rect width="100%" height="100%" fill="#777"></rect></svg>
									<div class="col-lg-8">
										<h6 class="mb-0">Example blog post title</h6>
										<small class="text-body-secondary">January 15, 2024</small>
									</div>
							</a></li>
							<li><a
								class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top"
								href="#"> <svg aria-hidden="true"
										class="bd-placeholder-img " height="96"
										preserveAspectRatio="xMidYMid slice" width="100%"
										xmlns="http://www.w3.org/2000/svg">
										<rect width="100%" height="100%" fill="#777"></rect></svg>
									<div class="col-lg-8">
										<h6 class="mb-0">This is another blog post title</h6>
										<small class="text-body-secondary">January 14, 2024</small>
									</div>
							</a></li>
							<li><a
								class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top"
								href="#"> <svg aria-hidden="true"
										class="bd-placeholder-img " height="96"
										preserveAspectRatio="xMidYMid slice" width="100%"
										xmlns="http://www.w3.org/2000/svg">
										<rect width="100%" height="100%" fill="#777"></rect></svg>
									<div class="col-lg-8">
										<h6 class="mb-0">Longer blog post title: This one has
											multiple lines!</h6>
										<small class="text-body-secondary">January 13, 2024</small>
									</div>
							</a></li>
						</ul>
					</div>
					<!-- 
					<div class="p-4">
						<h4 class="fst-italic">Archives</h4>
						<ol class="list-unstyled mb-0">
							<li><a href="#">March 2021</a></li>
							<li><a href="#">February 2021</a></li>
							<li><a href="#">January 2021</a></li>
							<li><a href="#">December 2020</a></li>
							<li><a href="#">November 2020</a></li>
							<li><a href="#">October 2020</a></li>
							<li><a href="#">September 2020</a></li>
							<li><a href="#">August 2020</a></li>
							<li><a href="#">July 2020</a></li>
							<li><a href="#">June 2020</a></li>
							<li><a href="#">May 2020</a></li>
							<li><a href="#">April 2020</a></li>
						</ol>
					</div>
					
					<div class="p-4">
						<h4 class="fst-italic">Elsewhere</h4>
						<ol class="list-unstyled">
							<li><a href="#">GitHub</a></li>
							<li><a href="#">Social</a></li>
							<li><a href="#">Facebook</a></li>
						</ol>
					</div>
					 -->
				</div>
			</div>
		</div>
		
	</main>
	 
	<jsp:include page="/layout/footer.jsp" />
	
</body>
</html>
</html>