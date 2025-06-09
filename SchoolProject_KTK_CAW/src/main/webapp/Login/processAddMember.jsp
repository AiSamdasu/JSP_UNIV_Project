<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String level = request.getParameter("level");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/user", "root", "7482");

    String sql = "INSERT INTO user (id, pw, level) VALUES (?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, id);
    ps.setString(2, pw);
    ps.setString(3, level);
    ps.executeUpdate();

    ps.close(); conn.close();
    response.sendRedirect("loginMember.jsp");
%>
