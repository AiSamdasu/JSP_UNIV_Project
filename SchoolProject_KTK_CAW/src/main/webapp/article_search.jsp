<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ch4 게시글 목록 출력을 위한 -->
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Article" %>
<%@ page import="dao.ArticleRepository" %>
<jsp:useBean id="articleDAO" class="dao.ArticleRepository" scope="session"/>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>

<title>articles</title>
<!-- css파일 -->
<link rel="stylesheet" type="text/css" href="./resources/css/article.css">
<!-- Like 버틍 누를 시 -->
<script type="text/javascript">
	function addToLike(){
		if(confirm("게시글을 좋아요 목록에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>

</head>
<body>
	
	<jsp:include page="/layout/header.jsp" />
	
	<main>
		<section class="py-5 text-center container">
			<form class="w-100 me-3" role="search">
				<input type="search" class="form-control" placeholder="Search ... " aria-label="Search">
			</form>
		</section>
		
		<!-- 게시글 모음집 -->
		<%
			// 새로쓴 게시글도 가져오기
			ArticleRepository dao=ArticleRepository.getInstance();
			ArrayList<Article> listOfArticles=dao.getAllArticles();
		
		%>
		
		
		<div class="album py-5 bg-body-tertiary">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<%
						for(int i=0;i<listOfArticles.size();i++){
							Article article = listOfArticles.get(i);
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
									
									<a href="addLike.jsp?id=<%=article.getArticleId()%>" class="btn btn-sm btn-outline-secondary" onclick="return confirm('게시글을 좋아요 목록에 추가하시겠습니까?');">LIKE</a>

									
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