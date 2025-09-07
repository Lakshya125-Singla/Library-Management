<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ include file="db.jsp" %>
        <%@ page session="true" %>
            <% if (session.getAttribute("username")==null) { response.sendRedirect("login.jsp"); } %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <title>Library Dashboard</title>
                    <!-- Tailwind CSS CDN -->
                    <style>
                        body {
                            font-family: Arial, sans-serif;
                            background-color: #f2f2f2;
                            margin: 0px;
                            padding: 0px;
                        }

                        h2 {
                            padding: 10px;
                            color: #333;
                            text-align: center;
                        }

                        h6 {
                            padding: 2px;
                            padding-left: 30px;
                            color: #333;
                        }

                        form {
                            background-color: #fff;
                            max-width: 400px;
                            margin: 0 auto;
                            padding: 20px;
                            border-radius: 10px;
                            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
                        }

                        input,
                        button {
                            display: block;
                            width: 100%;
                            margin: 10px 0;
                            padding: 10px;
                            border-radius: 6px;
                            border: 1px solid #ccc;
                        }

                        button {
                            background-color: #4CAF50;
                            color: white;
                            border: none;
                            cursor: pointer;
                        }

                        button:hover {
                            background-color: #45a049;
                        }

                        a {

                            color: #4CAF50;
                            text-decoration: none;
                            display: block;
                            margin-top: 10px;
                        }

                        table {
                            width: 90%;
                            margin: 20px auto;
                            border-collapse: collapse;
                            background-color: white;
                        }

                        table th,
                        table td {
                            border: 1px solid #ddd;
                            padding: 12px;
                            text-align: center;
                        }

                        table th {
                            background-color: #4CAF50;
                            color: white;
                        }

                        .navbar {
                            background-color: #333;
                            display: flex;
                            align-items: end;
                        }


                        .simple-navbar {
                            display: flex;
                            gap: 15px;
                            flex-wrap: wrap;
                        }

                        .menu-icon {
                            display: none;
                            font-size: 26px;
                            cursor: pointer;
                            color: white;
                        }

                        #menu-toggle {
                            display: none;
                            color: white;
                        }

                        /* Responsive Styles */
                        @media screen and (max-width: 768px) {
                            .simple-navbar {
                                display: none;
                                width: 100%;
                                flex-direction: column;
                                background-color: #444;
                                margin-top: 10px;
                                padding: 10px;
                            }

                            #menu-toggle:checked+.menu-icon+.navbar {
                                display: flex;
                            }

                            .menu-icon {
                                display: block;
                            }
                        }

                        .a {
                            color: white;
                            text-decoration: none;
                            padding: 8px 12px;
                            border-radius: 5px;
                            display: flex;
                            align-items: center;
                            gap: 5px;
                        }

                        .simple-navbar {
                            display: flex;
                            justify-content: flex-start;
                            /* Moves content to the right */
                            align-items: flex-start;
                            /* Aligns items to the bottom of the container */
                            background-color: #333;
                            padding: 2px 19px;
                            gap: 10px;
                            flex-wrap: wrap;
                        }

                        .simple-navbar a {
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            margin-top: 10px;
                            color: white;
                            text-decoration: none;
                            padding: 8px 12px;
                            border-radius: 5px;
                            transition: background 0.3s;
                        }

                        .simple-navbar a:hover {
                            background-color: #4CAF50;
                        }

                        .icons-bar {
                            margin-right: 5px;
                        }

                        .staff-main {
                            text-decoration: none;
                        }
                    </style>
                    <title>Library Dashboard</title>
                    <script src="https://cdn.tailwindcss.com"></script>
                </head>

                <body class="bg-gray-100 min-h-screen">

                    <!-- Navbar -->

                    <%@ include file="includes/navbar.jsp" %>
                        <% String role1=(String) session.getAttribute("role"); %>
                            <h2>Welcome, <%= session.getAttribute("username") %> to Library Dashboard.</h2>
                            <% out.println("<h6>Your role is: "+role1 +"</h6>"); %>



                                <!-- Dashboard Grid -->
                                <div class="p-8 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
                                    <% if("admin".equals(role1)) { %>

                                        <!-- Add Book -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="admin/add_book.jsp" class="text-center block">
                                                <img src="images/add-books.png" alt="Add Book"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">Add Book</h3>
                                            </a>
                                        </div>

                                        <!-- View Book -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="admin/view_books.jsp" class="text-center block">
                                                <img src="images/view-book.jpg" alt="View Book"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">View Book</h3>
                                            </a>
                                        </div>
                                        <!-- Delete Book -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="admin/delete_book.jsp" class="text-center block">
                                                <img src="images/delete-book.png" alt="Delete Book"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">Delete Book</h3>
                                            </a>
                                        </div>

                                        <!-- Issue Book -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="admin/issue_book.jsp" class="text-center block">
                                                <img src="images/issue-book.jpg" alt="Issue Book"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">Issue Book</h3>
                                            </a>
                                        </div>

                                        <!-- Return Book -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="admin/return_book.jsp" class="text-center block">
                                                <img src="images/return-book.jpg" alt="Return Book"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">Return Book</h3>
                                            </a>
                                        </div>

                                        <!-- Manage Admin -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="admin/manage_staff.jsp" class="text-center block">
                                                <img src="images/manage-admin.jpg" alt="Manage Admin"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">Manage Admin</h3>
                                            </a>
                                        </div>

                                        <!-- Logout -->
                                        <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                            <a href="logout.jsp" class="text-center block">
                                                <img src="images/logout.jpg" alt="Logout"
                                                    class="mx-auto w-24 h-24 object-contain">
                                                <h3 class="mt-4 font-semibold text-gray-800">Logout</h3>
                                            </a>
                                        </div>
                                        <% } if("staff".equals(role1)) { %>

                                            <!-- View Book -->
                                            <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                                <a href="staff/view_books.jsp" class="text-center block">
                                                    <img src="images/view-book.jpg" alt="View Book"
                                                        class="mx-auto w-24 h-24 object-contain">
                                                    <h3 class="mt-4 font-semibold text-gray-800">View Book</h3>
                                                </a>
                                            </div>

                                            <!-- Search Book -->
                                            <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                                <a href="staff/search_books.jsp" class="text-center block">
                                                    <img src="images/search-book.png" alt="Search Book"
                                                        class="mx-auto w-24 h-24 object-contain">
                                                    <h3 class="mt-4 font-semibold text-gray-800">Search Book</h3>
                                                </a>
                                            </div>

                                            <!-- Logout -->
                                            <div class="bg-white shadow-lg rounded-lg p-4 hover:scale-105 transition">
                                                <a href="logout.jsp" class="text-center block">
                                                    <img src="images/logout.jpg" alt="Logout"
                                                        class="mx-auto w-24 h-24 object-contain">
                                                    <h3 class="mt-4 font-semibold text-gray-800">Logout</h3>
                                                </a>
                                            </div>
                                            <% } %>
                                                <script src="https://unpkg.com/lucide@latest"></script>
                                                <script>
                                                    window.onload = () => lucide.createIcons();
                                                </script>
                                </div>
                </body>

                </html>