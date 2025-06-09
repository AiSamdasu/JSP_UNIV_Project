<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/user", "root", "7482");

    String sql = "SELECT * FROM user WHERE id = ? AND pw = ?";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, id);
    ps.setString(2, pw);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        session.setAttribute("id", id);
        session.setAttribute("level", rs.getString("level"));
        response.sendRedirect("main.jsp");
    } else {
        response.sendRedirect("loginFailed.jsp");
    }

    rs.close(); ps.close(); conn.close();
%>
