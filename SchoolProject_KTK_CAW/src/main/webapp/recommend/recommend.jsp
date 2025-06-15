<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="KNNRecommend.KNNRecommend" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ include file="../connection.jsp" %>

<%
    Integer userCode = (Integer) session.getAttribute("userCode");
    if (userCode == null) {
        response.sendRedirect("../Login/login.jsp");
        return;
    }

    int foodCode = -1;
    String foodName = "";
    int spicy = 0, sweet = 0, salty = 0, savory = 0, umami = 0;

    if ("POST".equals(request.getMethod())) {
        // 추천 실행
        try {
            KNNRecommend recommender = new KNNRecommend();
            foodCode = recommender.recommendFoodByUser(String.valueOf(userCode));

            // 추천된 Food 정보 가져오기
            PreparedStatement pstmt = conn.prepareStatement(
                "SELECT * FROM FoodList WHERE FoodCode = ?"
            );
            pstmt.setInt(1, foodCode);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                foodName = rs.getString("FoodName");
                spicy = rs.getInt("Spicy");
                sweet = rs.getInt("Sweet");
                salty = rs.getInt("Salty");
                savory = rs.getInt("Savory");
                umami = rs.getInt("Umami");
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>추천 오류: " + e.getMessage() + "</div>");
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>음식 추천</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">
	<jsp:include page="/layout/header.jsp" />
    <h2 class="mb-4">KNN 기반 음식 추천</h2>

    <!-- 추천 버튼 -->
    <form method="post">
        <button type="submit" class="btn btn-primary">추천받기</button>
    </form>

    <!-- 추천 결과 -->
    <%
        if (foodCode != -1) {
    %>
    <div class="card mt-4 p-4">
        <h4><%= foodName %> (FoodCode: <%= foodCode %>)</h4>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">매운맛: <%= spicy %></li>
            <li class="list-group-item">단맛: <%= sweet %></li>
            <li class="list-group-item">짠맛: <%= salty %></li>
            <li class="list-group-item">고소함: <%= savory %></li>
            <li class="list-group-item">감칠맛: <%= umami %></li>
        </ul>
    </div>
    <% } %>

    <a href="../main.jsp" class="btn btn-secondary mt-4">메인으로</a>
    	<jsp:include page="/layout/footer.jsp" />
</body>
</html>
