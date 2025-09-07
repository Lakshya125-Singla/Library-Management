<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
<form method="post">
    <h2>Register</h2>
    <input type="text" name="username" required placeholder="Username"><br>
    <input type="email" name="email" required placeholder="Email"><br>
    <input type="password" name="password" required placeholder="Password"><br>
    <button type="submit">Register</button>
</form>
<%
if (request.getMethod().equalsIgnoreCase("post")) {
  String uname = request.getParameter("username");
  String email = request.getParameter("email");
  String pwd = request.getParameter("password");

  %><%@ include file="db.jsp" %><%
  PreparedStatement ps = con.prepareStatement("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
  ps.setString(1, uname);
  ps.setString(2, email);
  ps.setString(3, pwd);
  ps.executeUpdate();
  out.println("<p class='text-success'>User registered successfully!</p>");
}
%>
