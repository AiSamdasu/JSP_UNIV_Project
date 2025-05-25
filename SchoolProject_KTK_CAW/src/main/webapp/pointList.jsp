<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dao.pointProductRepository" %>
<%@ page import="dto.PointProduct" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>포인트 사용</title>
    <%@ include file="/resource/bootstrap/bootstrap.jsp" %>

    <link rel="stylesheet" href="/resource/css/pointList.css">

    
</head>
<body>
<jsp:include page="layout/header.jsp">
<%
    String productCodeParam = request.getParameter("ProductCode");
    int productCode = Integer.parseInt(productCodeParam);  // 문자열을 정수로 변환

    pointProductRepository dao = pointProductRepository.getInstance();
    PointProduct pointProduct = dao.getPointProductById(productCode);
%>

<div class='ListBlock'>
	<div class='List'>
		<h3><b><%= PointProduct.getProductName() %></b></h3>
	</div>


</div>




</body>