<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="dao.pointProductRepository" %>
<%@ page import="dto.PointProduct" %>

<%
    String productCode = request.getParameter("ProductCode");

    pointProductRepository dao = pointProductRepository.getInstance();
    PointProduct pointProduct = dao.getPointProductById(productCode);
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


<% if (pointProduct != null) { %>
    <div class='ListBlock'>
        <div class='List'>
            <h3><b><%= pointProduct.getProductName() %></b></h3>
            <p><b>제품 명 : </b> <%= pointProduct.getProductName() %></p>
            <p><b>제품 코드 : </b> <%= pointProduct.getProductCode() %></p>
            <p><b>가격 : </b> <%= pointProduct.getProductPrice() %></p>
            <p><b>남은 수량 : </b> <%= pointProduct.getRemainingQuantity() %></p>
            <p><b>설명 : </b> <%= pointProduct.getDescription() %></p>
        </div>
    </div>
<% } else { %>
    <p style="color:red;">해당 상품 정보를 찾을 수 없습니다.</p>
<% } %>




</body>