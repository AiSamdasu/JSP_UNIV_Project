<!-- https://getbootstrap.kr/docs/5.3/examples/blog/# -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<title>main</title>
<!-- css파일 -->
<link rel="stylesheet" type="text/css" href="./resources/css/article.css">

</head>

<body>
	<jsp:include page="/layout/header.jsp" />
	
	<main class="container">
		<div
			class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary">
			<div class="col-lg-6 px-0">
				<h4 class="display-11 fst-italic">오늘 뭐 먹을지 고민된다면?
				</h4>
				<h1 class="display-4 fst-italic"><b>
				"오늘의 레시피"</b></h1>
				<p class="lead my-3">오늘의 레시피는 사용자 맞춤 추천 레시피 웹사이트입니다. 
				당신에게 딱 맞춘 나만의 레시피를 지금 찾아보세요!</p>
				<p class="lead mb-0">
					<a href="#" class="text-body-emphasis fw-bold">회원가입 >></a>
				</p>
			</div>
		</div>
		<div class="row mb-2">
		<div class="col-md-6">
				
				<!-- 여기에 본문 영역 -->
				
			</div>
		</div>
		
	</main>
	
	<jsp:include page="/layout/footer.jsp" />

</body>
</html>