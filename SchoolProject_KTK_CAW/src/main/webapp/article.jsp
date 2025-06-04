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
					<p><%=article.getDescription() %></p>
					<h2 class="display-5 link-body-emphasis mb-1"><%=article.getTitle() %></h2>
					<p class="blog-post-meta">
						<%=article.getDate() %> | <a href="#"><%=article.getUser() %></a>  <!-- 사용자 링크 -->
					</p>
					<hr>
				
					<table class="table">
						<thead>
						
							<tr>
								<th>분류</th>
								<th>정도</th>
							</tr>
						</thead>
						<tbody>
						<% if(article.getSpicy()!=0){ %>
							<tr>
								<td>매운맛</td>
								<td><% for(int i=0;i<article.getSpicy();i++){%>
								🟨
								<%} 
								for(int j=5-article.getSpicy();j>0;j--){
								%>▫️
								<%} %>	
								</td>
						<%} %>
							</tr>
							
							
							<% if(article.getSweet()!=0){ %>
							<tr>
								<td>달콤한맛</td>
								<td><% for(int i=0;i<article.getSweet();i++){%>
								🟨
								<%} 
								for(int j=5-article.getSweet();j>0;j--){
								%>▫️
								<%} %>	
								</td>
						<%} %>
							</tr>
							
							<% if(article.getSalty()!=0){ %>
							<tr>
								<td>짠맛</td>
								<td><% for(int i=0;i<article.getSalty();i++){%>
								🟨
								<%} 
								for(int j=5-article.getSalty();j>0;j--){
								%>▫️
								<%} %>	
								</td>
						<%} %>
							</tr>
							
							<% if(article.getSavory()!=0){ %>
							<tr>
								<td>고소한맛</td>
								<td><% for(int i=0;i<article.getSavory();i++){%>
								🟨
								<%} 
								for(int j=5-article.getSavory();j>0;j--){
								%>▫️
								<%} %>	
								</td>
						<%} %>
							</tr>
							
							<% if(article.getUmami()!=0){ %>
							<tr>
								<td>감칠맛</td>
								<td><% for(int i=0;i<article.getUmami();i++){%>
								🟨
								<%} 
								for(int j=5-article.getUmami();j>0;j--){
								%>▫️
								<%} %>	
								</td>
						<%} %>
							</tr>
						</tbody>
						
					</table>
					
					<hr>
					
					<p><%=article.getRecipe() %></p>
					
					
				</article>
				
				
				<hr>
				<a href="addLike.jsp?id=<%=article.getArticleId()%>" class="btn btn-sm btn-outline-secondary" onclick="return confirm('게시글을 좋아요 목록에 추가하시겠습니까?');">LIKE</a>
				<hr>
			
			</div>
			
			
			<!-- 옆에 서브 테이블 -->
			<div class="col-md-4">
				<div class="position-sticky" style="top: 2rem;">
				
				<!-- 작성자에 대한 정보 -->
					<div class="p-4 mb-3 bg-body-tertiary rounded">
						<h4 class="fst-italic"><a href="#"><%=article.getUser() %></a></h4>
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

				</div>
			</div>
		</div>
		
	</main>
	 
	<jsp:include page="/layout/footer.jsp" />
	
</body>
</html>
</html>