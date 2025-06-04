<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>

<title>userPage</title>

<%
	String LikeCartId=session.getId();
%>
<!-- css파일 -->
<link rel="stylesheet" type="text/css" href="./resources/css/article.css">

</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	
	<main>
		<section class="py-5 text-center container">
		
			
				<div class="col-lg-6 col-md-8 mx-auto">
					<p class="lead text-body-secondary"> 회원 정보란
					<div class="col-lg-4">
					<svg aria-label="Placeholder"
						class="bd-placeholder-img rounded-circle" height="140"
						preserveAspectRatio="xMidYMid slice" role="img" width="140"
						xmlns="http://www.w3.org/2000/svg">
						<title>Placeholder</title><rect width="100%" height="100%"
							fill="var(--bs-secondary-color)"></rect></svg>
					<h2 class="fw-normal">회원 이름</h2>
					<p>회원 소개</p>
					<p>
						<a class="btn btn-secondary" href="#">View details &raquo;</a>
					</p>
				</div>	
					<p>
						<a href="#" class="btn btn-primary my-2">Main call to action</a> <a
							href="#" class="btn btn-secondary my-2">Secondary action</a>
					</p>
				</div>
				
	
		</section>
		
		
		<%
		int sum=0;
		ArrayList<Article> likelist=(ArrayList<Article>)session.getAttribute("likelist");
		if (likelist == null) {
		    likelist = new ArrayList<Article>();
		}


	%>
	<p>좋아요한 게시글 수: <%=likelist.size()%></p>
	
		<div class="album py-5 bg-body-tertiary">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<%
						for(int i=0;i<likelist.size();i++){
							Article article = likelist.get(i);
					%>
					<!-- 게시글 하나씩 출력 -->
					<div class="col">
						<div class="card shadow-sm">
								<img src="./resources/images/<%=article.getFilename() %>" style="width:100%; height:100%"/>
							<div class="card-body">
								<p class="card-text"><h5><b><%=article.getTitle() %></b></h5>
								<p class="card-text"><%=article.getDescription()%></p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
									<!-- button에서 a로 바꿈 -->
										<a href= "./article.jsp?id=<%=article.getArticleId()%>" type="button" class="btn btn-sm btn-outline-secondary">View</a>
										
									</div>
									<small class="text-body-secondary">
									<!-- like 리스트에서 삭제하기 -->
										<a href="./remove_like.jsp?id=<%=article.getArticleId()%>"class="btn btn-sm btn-outline-secondary">Delete</a>
									</small>
								</div>
							</div>
						</div>
					</div>
					<% } %>
				
					
					
				</div>
			</div>
		</div>
	</main>
	
	
	<jsp:include page="/layout/footer.jsp" />
	
	</body>
</html>