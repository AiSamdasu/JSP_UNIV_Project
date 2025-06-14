<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="../connection.jsp" %> <!-- DB 연결 -->
<%
    int userCode = (session.getAttribute("UserCode") != null) ? (Integer) session.getAttribute("UserCode") : -1;

    if (userCode == -1) {
        response.sendRedirect("Login/login.jsp");
        return;
    }

    int spicy = 3, sweet = 3, salty = 3, savory = 3, umami = 3;

    try {
        if ("POST".equals(request.getMethod())) {
            spicy = Integer.parseInt(request.getParameter("spicy"));
            sweet = Integer.parseInt(request.getParameter("sweet"));
            salty = Integer.parseInt(request.getParameter("salty"));
            savory = Integer.parseInt(request.getParameter("savory"));
            umami = Integer.parseInt(request.getParameter("umami"));

            String updateSql = "UPDATE UserTaste SET UserSpicy=?, UserSweet=?, UserSalty=?, UserSavory=?, UserUmami=? WHERE UserCode=?";
            PreparedStatement pstmt = conn.prepareStatement(updateSql);
            pstmt.setInt(1, spicy);
            pstmt.setInt(2, sweet);
            pstmt.setInt(3, salty);
            pstmt.setInt(4, savory);
            pstmt.setInt(5, umami);
            pstmt.setInt(6, userCode);
            pstmt.executeUpdate();
            pstmt.close();

            out.println("<div class='alert alert-success mt-3'>맛 정보가 성공적으로 수정되었습니다.</div>");
        } else {
            String sql = "SELECT * FROM UserTaste WHERE UserCode = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userCode);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                spicy = rs.getInt("UserSpicy");
                sweet = rs.getInt("UserSweet");
                salty = rs.getInt("UserSalty");
                savory = rs.getInt("UserSavory");
                umami = rs.getInt("UserUmami");
            }
            rs.close();
            pstmt.close();
        }
    } catch (Exception e) {
        out.println("<div class='alert alert-danger'>오류: " + e.getMessage() + "</div>");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>맛 선호도 수정</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        .slider-value {
            font-weight: bold;
            margin-left: 10px;
        }
    </style>
</head>
<body class="container mt-5">
    <h2>맛 선호도 수정</h2>

    <form method="post">
        <div class="mb-3">
            <label>매운맛: <span id="spicyVal" class="slider-value"><%= spicy %></span></label>
            <input type="range" class="form-range" name="spicy" min="1" max="5" value="<%= spicy %>" oninput="spicyVal.innerText = this.value">
        </div>
        <div class="mb-3">
            <label>단맛: <span id="sweetVal" class="slider-value"><%= sweet %></span></label>
            <input type="range" class="form-range" name="sweet" min="1" max="5" value="<%= sweet %>" oninput="sweetVal.innerText = this.value">
        </div>
        <div class="mb-3">
            <label>짠맛: <span id="saltyVal" class="slider-value"><%= salty %></span></label>
            <input type="range" class="form-range" name="salty" min="1" max="5" value="<%= salty %>" oninput="saltyVal.innerText = this.value">
        </div>
        <div class="mb-3">
            <label>고소함: <span id="savoryVal" class="slider-value"><%= savory %></span></label>
            <input type="range" class="form-range" name="savory" min="1" max="5" value="<%= savory %>" oninput="savoryVal.innerText = this.value">
        </div>
        <div class="mb-3">
            <label>감칠맛: <span id="umamiVal" class="slider-value"><%= umami %></span></label>
            <input type="range" class="form-range" name="umami" min="1" max="5" value="<%= umami %>" oninput="umamiVal.innerText = this.value">
        </div>

        <button type="submit" class="btn btn-success">저장</button>
    </form>
</body>
</html>
