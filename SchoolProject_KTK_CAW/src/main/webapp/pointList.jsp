<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.pointProductRepository" %>
<%@ page import="dto.PointProduct" %>
<%@ page import="java.util.*" %>

<%
    String productCode = request.getParameter("ProductCode");
    pointProductRepository dao = pointProductRepository.getInstance();

    // 상품 코드가 있으면 상세조회, 없으면 전체 목록
    PointProduct pointProduct = null;
    List<PointProduct> pointProducts = null;

    if (productCode != null && !productCode.trim().equals("")) {
        pointProduct = dao.getPointProductById(productCode);
    } else {
        pointProducts = dao.getAllProducts();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포인트 사용</title>
    <%@ include file="/resource/bootstrap/bootstrap.jsp" %>
    <link rel="stylesheet" href="/resource/css/pointList.css">
</head>
<body>
    <jsp:include page="layout/header.jsp" />

    <%-- 상품 상세 화면 --%>
    <% if (pointProduct != null) { %>
        <div class='ListBlock'>
            <div class='List'>
                <h3><b><%= pointProduct.getProductName() %></b></h3>
                <p><b>제품 명 : </b> <%= pointProduct.getProductName() %></p>
                <p><b>제품 코드 : </b> <%= pointProduct.getProductCode() %></p>
                <p><b>가격 : </b> <%= pointProduct.getProductPrice() %>P</p>
                <p><b>남은 수량 : </b> <%= pointProduct.getRemainingQuantity() %></p>
                <p><b>설명 : </b> <%= pointProduct.getDescription() %></p>
                <br>
                <a href="pointList.jsp">← 목록으로 돌아가기</a>
            </div>
        </div>

    <%-- 상품 목록 화면 --%>
    <% } else if (productCode == null || productCode.trim().equals("")) { %>
        <div class='ListBlock'>
        <% if (pointProducts != null && !pointProducts.isEmpty()) {
               for (PointProduct product : pointProducts) {
        %>
            <div class='List'>
                <h3><a href="pointList.jsp?ProductCode=<%= product.getProductCode() %>">
                    <%= product.getProductName() %></a></h3>
                <p>가격: <%= product.getProductPrice() %>P</p>
                <p>남은 수량: <%= product.getRemainingQuantity() %></p>
            </div>
        <% } } else { %>
            <p style="color:red;">상품이 없습니다.</p>
        <% } %>
        </div>

    <%-- 잘못된 ProductCode일 경우 --%>
    <% } else { %>
        <p style="color:red;">해당 상품 정보를 찾을 수 없습니다.</p>
        <a href="pointList.jsp">← 목록으로 돌아가기</a>
    <% } %>

</body>
</html>
