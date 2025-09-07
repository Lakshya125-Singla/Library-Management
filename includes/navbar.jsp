
<%@ page session="true" %>
<script src="https://unpkg.com/lucide@latest"></script>
<script>
    window.onload = () => lucide.createIcons();
</script>
<div class="navbar">
        <input type="checkbox" id="menu-toggle"/>
        <label for="menu-toggle" class="menu-icon">&#9776;</label>
        <div class="simple-navbar">
		        <% String role = (String) session.getAttribute("role");
        if (role == null) {
          response.sendRedirect("login.jsp");
          return;
        }
        else if ("admin".equals(role)) { %>
			<a  href="admin/add_book.jsp"><i class="icons-bar" data-lucide="plus-square"></i>Add Book</a>
			<a  href="admin/view_books.jsp"><i class="icons-bar" data-lucide="book-open-text"></i>View Books</a>
			<a  href="admin/delete_book.jsp"><i class="icons-bar" data-lucide="delete"></i>Delete Book</a>
			<a  href="admin/issue_book.jsp"><i class="icons-bar" data-lucide="send"></i>Issue Book</a>
			<a  href="admin/return_book.jsp"><i class="icons-bar" data-lucide="corner-up-left"></i>Return Book</a>
			<a  href="admin/manage_staff.jsp"><i class="icons-bar" data-lucide="square-user-round"></i>Manage Admin</a>
        <% } else if ("staff".equals(role)) { %>
          <a href="staff/view_books.jsp"><i class="icons-bar" data-lucide="book-open-text"></i>View Books</a>
          <a href="staff/search_books.jsp"><i class="icons-bar" data-lucide="search"></i>Search Books</a>
        <% } %>
                <a class=" end-nav" href="login.jsp"><i class="icons-bar" data-lucide="log-out"></i> Log-Out</a>
		</div>
		</div>
    
