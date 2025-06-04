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
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-primary-emphasis">World</strong>
						<h3 class="mb-0">Featured post</h3>
						<div class="mb-1 text-body-secondary">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
							Continue reading <svg class="bi" aria-hidden="true">
								<use xlink:href="#chevron-right"></use></svg>
						</a>
					</div>
					<div class="col-auto d-none d-lg-block">
						<svg aria-label="Placeholder: Thumbnail"
							class="bd-placeholder-img " height="250"
							preserveAspectRatio="xMidYMid slice" role="img" width="200"
							xmlns="http://www.w3.org/2000/svg">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#55595c"></rect>
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-primary-emphasis">World</strong>
						<h3 class="mb-0">Featured post</h3>
						<div class="mb-1 text-body-secondary">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
							Continue reading <svg class="bi" aria-hidden="true">
								<use xlink:href="#chevron-right"></use></svg>
						</a>
					</div>
					<div class="col-auto d-none d-lg-block">
						<svg aria-label="Placeholder: Thumbnail"
							class="bd-placeholder-img " height="250"
							preserveAspectRatio="xMidYMid slice" role="img" width="200"
							xmlns="http://www.w3.org/2000/svg">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#55595c"></rect>
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-success-emphasis">Design</strong>
						<h3 class="mb-0">Post title</h3>
						<div class="mb-1 text-body-secondary">Nov 11</div>
						<p class="mb-auto">This is a wider card with supporting text
							below as a natural lead-in to additional content.</p>
						<a href="#" class="icon-link gap-1 icon-link-hover stretched-link">
							Continue reading <svg class="bi" aria-hidden="true">
								<use xlink:href="#chevron-right"></use></svg>
						</a>
					</div>
					<div class="col-auto d-none d-lg-block">
						<svg aria-label="Placeholder: Thumbnail"
							class="bd-placeholder-img " height="250"
							preserveAspectRatio="xMidYMid slice" role="img" width="200"
							xmlns="http://www.w3.org/2000/svg">
							<title>Placeholder</title><rect width="100%" height="100%"
								fill="#55595c"></rect>
							<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					</div>
				</div>
				
				
			</div>
		</div>
		
	</main>
	
	<jsp:include page="/layout/footer.jsp" />

</body>
</html>