<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>회원가입</title></head>
<body>
<h2>회원가입</h2>
<form method="post" action="processAddMember.jsp">
    아이디: <input type="text" name="id"><br>
    비밀번호: <input type="password" name="pw"><br>
    등급:
    <select name="level">
        <option value="nomal">일반</option>
        <option value="mid">중간</option>
        <option value="admin">관리자</option>
    </select><br>
    <input type="submit" value="가입">
</form>
</body>
</html>
