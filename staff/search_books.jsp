<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Search Book</title>
  <style>
a {
    color: #4CAF50;
    text-decoration: none;
    display: block;
    text-align: center;
    margin-top: 10px;
}

</style>
</head>
<body class="container mt-4">
<h3>Search Book</h3>
<form method="get" class="mb-4">
  <input type="text" name="query" class="form-control" placeholder="Enter title or author" required>
</form>

<table class="table table-striped" border="1">
  <thead>
    <tr><th>Title</th><th>Author</th></tr>
  </thead>
  <tbody>
<%
String q = request.getParameter("query");
if (q != null) {
    %>
	<%@ include file="../db.jsp" %>
<%
    PreparedStatement ps = con.prepareStatement("SELECT * FROM books WHERE title LIKE ? OR author LIKE ?");
    ps.setString(1, "%" + q + "%");
    ps.setString(2, "%" + q + "%");
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
%>
    <tr>
      <td><%= rs.getString("title") %></td>
      <td><%= rs.getString("author") %></td>
    </tr>
<% } } %>
  </tbody>
</table>
<a href="../dashboard.jsp">Back to Dashboard</a>
</body>
</html>
