<%@ include file="../db.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>View Books</title>
    <script src="../js/script.js" defer></script>
 <link rel="stylesheet" href="../css/style.css">
	</head>
<body>
<h2>Available Books</h2>
<table border="1">
    <tr><th>ID</th><th>Title</th><th>Author</th><th>ISBN</th><th>Available</th></tr>

<%
    ResultSet rs = con.createStatement().executeQuery("SELECT * FROM books");
    while(rs.next()) {
%>
      <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("title") %></td>
        <td><%= rs.getString("author") %></td>
		 <td><%=rs.getString("isbn")%></td>
        <td><%=rs.getBoolean("available") ? "Yes" : "No"%></td>
      </tr>
    <% } %>
  </tbody>
</table>
<a href="../dashboard.jsp">Back to Dashboard</a>
</body>
</html>

