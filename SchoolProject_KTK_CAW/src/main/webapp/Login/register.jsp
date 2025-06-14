<%@ page import="java.sql.*" %>
<%@ page import="Util_DB.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-5">

<h2>회원가입</h2>
<form method="post">
    <input type="text" name="userid" placeholder="아이디" class="form-control mb-2" required>
    <input type="password" name="userpw" placeholder="비밀번호" class="form-control mb-2" required>
    <input type="text" name="username" placeholder="이름" class="form-control mb-2" required>
    <input type="number" name="age" placeholder="나이" class="form-control mb-2">
    <input type="text" name="address" placeholder="주소" class="form-control mb-2">
    <button type="submit" class="btn btn-primary">가입하기</button>
</form>

<%
    if(request.getMethod().equals("POST")) {
        String id = request.getParameter("userid");
        String pw = request.getParameter("userpw");
        String name = request.getParameter("username");
        String age = request.getParameter("age");
        String address = request.getParameter("address");

        try {
            Connection conn = DBConnection.getConnection();

            // User 테이블에 삽입
            String sql1 = "INSERT INTO User(UserID, UserPW, UserName, UserAge, UserAddress) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
            pstmt1.setString(1, id);
            pstmt1.setString(2, pw);
            pstmt1.setString(3, name);
            pstmt1.setInt(4, Integer.parseInt(age));
            pstmt1.setString(5, address);
            pstmt1.executeUpdate();

            ResultSet rs = pstmt1.getGeneratedKeys();
            int userCode = -1;
            if(rs.next()) {
                userCode = rs.getInt(1);
            }

            // UserInfo 테이블에 삽입
            String sql2 = "INSERT INTO UserInfo(UserCode, level) VALUES (?, ?)";
            PreparedStatement pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setInt(1, userCode);
            pstmt2.setString(2, "nomal");
            pstmt2.executeUpdate();

            out.println("<div class='alert alert-success mt-3'>회원가입 성공! 로그인하세요.</div>");
            pstmt1.close(); pstmt2.close(); conn.close();
            response.sendRedirect("login.jsp");
        } catch(Exception e) {
            out.println("<div class='alert alert-danger mt-3'>오류 발생: " + e.getMessage() + "</div>");
        }
    }
%>

</body>
</html>
