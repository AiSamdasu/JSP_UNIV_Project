<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date , java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>

	<title>article_write</title>

	<!-- CSs파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/article.css">
	<!-- 유효성 검사를 위한 script -->
	<script type="text/javascript" src="./resources/script/validation.js"></script>
	<!-- 다국어 처리를 위한 import -->
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>

<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message">


<body class="bg-body-tertiary">

	<jsp:include page="/layout/header.jsp" />

	<div class="container">
		<main>			
			<div class="row g-5 py-5">			
				<div class="py-5">
				<!-- 게시글 작성 h -->
					<h4 class="mb-3"><fmt:message key="article_write"/></h4>
					<div class="text-end">
						<a href="?language=ko">Korean</a> | <a href="?language=en">English</a> 
					</div>

					<!-- 게시글 작성 form -->
					<form name="newArticle" action="./processAddArticle.jsp" method="post" enctype="multipart/form-data">
						<div class="row g-3">
							
							<!-- 제목 -->
							<div class="col-12">
								<label for="title" class="form-label"><fmt:message key="article_title"/></label> 
								<!-- 유효성 검사를 위한 id= -->
								<!-- 다국어 처리를 위한 value= -->
								<input
									type="text" id="title"  name="title" class="form-control">
							</div>
						</div>
						<hr class="my-4">
						
						
						<!-- 음식에 대한 한줄평 -->
						<div class="col-12">
								<label for="description" class="form-label"><fmt:message key="article_description"/></label> 
								<input
									type="text" id="description" name="description" class="form-control">
							</div>
						
						
						<!-- 이미지 -->
						<div class="col-12">
								<label for="description" class="form-label"><fmt:message key="article_image"/></label> 
								<input
									type="file" id="ArticleImage" value="<fmt:message key="article_image"/>" name="ArticleImage" class="form-control">
							</div>
						
						<!-- 본문 레시피 -->
						<div class="col-12">
								<label for="description" class="form-label"><fmt:message key="article_recipe"/></label> 
								<input
									type="text" id="recipe" name="recipe" class="form-control">
							</div>
							
							
						<hr class="my-4">
						<!-- 업로드 버튼 -->
						<!-- 유효성검사 onclick -->
						<input class="w-100 btn btn-primary btn-lg" type="button" value="<fmt:message key="article_upload"/>" onclick="CheckAddArticle()">
						
					</form>
				</div>
			</div>
		</main>
		
	</div>
	</fmt:bundle>
	
	
	<jsp:include page="/layout/footer.jsp" />
</body>
</html>