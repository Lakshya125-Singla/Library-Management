  <%@ include file="db.jsp" %>
  <%@ page import="java.sql.*" %>
<html>
<head>
  <title>Login</title>
<link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
<%
if (request.getMethod().equalsIgnoreCase("post")) {
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
  ps.setString(1, username);
  ps.setString(2, password);
  ResultSet rs = ps.executeQuery();

  if (rs.next()) {
    session.setAttribute("username", username);
    session.setAttribute("role", rs.getString("role"));
    response.sendRedirect("dashboard.jsp");
  } else {
    out.println("<p class='text-danger'>Invalid login!</p>");
  }
}
%>
  <form method="post">
  <h2>Login</h2>
      <input type="text"  name="username" required placeholder="Username"><br>
      <input type="password"  name="password" required placeholder="Password"><br>
    <button type="submit" >Login</button>
  </form>
<a href="register.jsp">Don't have an account? Register</a>

</body>
</html>
