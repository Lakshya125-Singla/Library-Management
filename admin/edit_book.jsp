<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String isbn = request.getParameter("isbn");
    String author = request.getParameter("author");

    if(request.getMethod().equalsIgnoreCase("POST")) {
        // Validation check
        if(title == null || title.trim().equals("") || author == null || author.trim().equals("") || isbn== null || isbn.trim().equals("")) {
            out.println("<div class='alert alert-danger'>Title and Author cannot be empty!</div>");
        } else {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root");

                String sql = "UPDATE books SET title=?, author=?, isbn=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, title);
                ps.setString(2, author);
                ps.setString(3, isbn);
                ps.setInt(4, Integer.parseInt(id));

                int result = ps.executeUpdate();
                if(result > 0) {
                    out.println("<div class='alert alert-success'>Book updated successfully!</div>");
                } else {
                    out.println("<div class='alert alert-danger'>Book not found!</div>");
                }

                con.close();
            } catch(Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        }
    } else {
        // GET request: Load existing book details
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "root");

            String sql = "SELECT * FROM books WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                title = rs.getString("title");
                author = rs.getString("author");
                isbn = rs.getString("isbn");
            } else {
                out.println("<div class='alert alert-danger'>Book not found!</div>");
            }

            con.close();
        } catch(Exception e) {
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
%>
<html>
<head>
<title>Edit Book</title>
 <link rel="stylesheet" href="../css/style.css">
    <script src="../js/script.js" defer></script>
	</head>
<body>
<form method="post" action="edit_book.jsp">

    <h2>Edit Book</h2>
	<input type="hidden" name="id" value="<%=id%>">
    <input type="text" name="title" value="<%=title%>" required><br>
    <input type="text" name="author" value="<%=author%>" required><br>
    <input type="text" name="isbn" value="<%=isbn%>" required><br>
    <button type="submit">Update Book</button>
</form>
<a href="view_books.jsp">Back</a>
</body>
</html>

