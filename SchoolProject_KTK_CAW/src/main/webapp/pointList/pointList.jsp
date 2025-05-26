<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.pointProductRepository"%>
<%@ page import="dto.PointProduct"%>
<%@ page import="java.util.*"%>

<%
pointProductRepository dao = pointProductRepository.getInstance();
List<PointProduct> pointProducts = dao.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 상품 목록</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/pointList.css">
<script
	src="<%=request.getContextPath()%>/resources/script/pointListModal.js"></script>

</head>

<body>
	<jsp:include page="../layout/header.jsp" />

	<div class="ListBlock">
	<%
		for (int i = 0; i < pointProducts.size(); i++) {
			PointProduct product = pointProducts.get(i);
	%>
		<div class="List">
			<h3><%= product.getProductName() %></h3>
			<p>가격: <%= product.getProductPrice() %>P</p>
			<p>남은 수량: <%= product.getRemainingQuantity() %></p>
			<div>
				<button class="detailBTN" onclick="openPointModal('<%= product.getProductCode() %>')">상세보기</button>
				<button class="purchaseBTN" onclick="#">포인트 교환하기</button>
			</div>
		</div>
	<%
		}
	%>
</div>


	<jsp:include page="../pointList/Pointmodal.jsp" />
</body>
</html>
