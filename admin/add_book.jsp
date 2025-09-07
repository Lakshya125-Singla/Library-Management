
<%@ include file="../db.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Add Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js" defer></script>
	</head>
<body>
<%
if (!"admin".equals(session.getAttribute("role"))) {
  response.sendRedirect("../unauthorized.jsp"); return;
}
if (request.getMethod().equalsIgnoreCase("post")) {
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String isbn = request.getParameter("isbn");
  PreparedStatement ps = con.prepareStatement("INSERT INTO books (title, author, isbn) VALUES (?, ?, ?)");
  ps.setString(1, title);
  ps.setString(2, author);
  ps.setString(3, isbn);
  ps.executeUpdate();
  out.println("Book added successfully!");
}
%>
<form method="post">
    <h2>Add Book</h2>
    <input type="text" name="title" required placeholder="Title"><br>
    <input type="text" name="author" required placeholder="Author"><br>
    <input type="text" name="isbn" required placeholder="ISBN"><br>
    <button type="submit">Add Book</button>
</form>
<a href="../dashboard.jsp">Back to Dashboard</a>
</body>
</html>