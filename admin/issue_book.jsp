<%@ include file="../db.jsp" %>
<%@ page import="java.sql.*" %>
<% if (!"admin".equals(session.getAttribute("role"))) {
  response.sendRedirect("../unauthorized.jsp"); return;
} %>
<html>
<head>
<title>Issue Book</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js" defer></script>
	</head>
<body>
 
<%
if (request.getMethod().equalsIgnoreCase("post")) {
          int bookId = Integer.parseInt(request.getParameter("book_id"));
  String issuedTo = request.getParameter("issued_to");
 
  PreparedStatement ps = con.prepareStatement("INSERT INTO issued_books (book_id, issued_to, issue_date) VALUES (?, ?, NOW())");
  ps.setInt(1,bookId);
  ps.setString(2, issuedTo);
  ps.executeUpdate();
   PreparedStatement update = con.prepareStatement("UPDATE books SET available=FALSE WHERE id=?");
        update.setInt(1, bookId);
        update.executeUpdate();
        out.println("<p>Book Issued.</p>");
}
%>
 <form method="post">
  <h2>Issue Book</h2>
      <input type="number" name="book_id" class="form-control" required placeholder="Book ID"><br>
      <input type="text" name="issued_to" class="form-control" required placeholder="Issued To (Staff Username)"><br>
    <button type="submit" >Issue Book</button>
  </form>
<a  href="../dashboard.jsp">Back to Dashboard</a>
