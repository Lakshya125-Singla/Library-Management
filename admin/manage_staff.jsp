<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<title>Create Admin Account</title>
<% if (!"admin".equals(session.getAttribute("role"))) {
  response.sendRedirect("../unauthorized.jsp"); return;
} %>
<form method="post">
<h2>Create Admin Account</h2>
  Username: <input name="username"><br>
  Password: <input type="password" name="password"><br>
  <button type="submit" >Create </button>
</form>
<%
if (request.getMethod().equalsIgnoreCase("post")) {
  String uname = request.getParameter("username");
  String pwd = request.getParameter("password");
  %><%@ include file="../db.jsp" %><%
  PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, password, role) VALUES (?, ?, 'admin')");
  ps.setString(1, uname);
  ps.setString(2, pwd);
  ps.executeUpdate();
  out.println("Admin account created.");
}
%>
<a href="../dashboard.jsp">Back to Dashboard</a>
