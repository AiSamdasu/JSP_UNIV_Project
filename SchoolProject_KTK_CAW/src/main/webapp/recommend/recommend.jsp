
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="KNNRecommend.KNNRecommend" %>
<!DOCTYPE html>
<html>
<head>
    <title>음식 추천</title>
</head>
<body>
    <h2>음식 추천 받기</h2>

    <form method="post">
        <input type="submit" name="recommendBtn" value="추천하기">
    </form>

<%
    // 로그인 시 저장해둔 세션에서 UserCode 불러오기
    String userCode = (String) session.getAttribute("UserCode");

    // 추천 버튼이 눌렸는지 확인
    if (request.getMethod().equalsIgnoreCase("POST") && request.getParameter("recommendBtn") != null) {

        if (userCode != null) {
            KNNRecommend knn = new KNNRecommend();
            int recommendedFoodCode = knn.recommendFoodByUser(userCode);
            out.println("<p><strong>추천된 음식 코드: " + recommendedFoodCode + "</strong></p>");
        } else {
            out.println("<p style='color:red;'>사용자 정보가 없습니다.</p>");
        }
    }
%>

</body>
</html>
