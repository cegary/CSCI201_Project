<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Navbar Example</title>
    <link href="styles/output.css" rel="stylesheet"> <!-- Include Tailwind CSS -->
</head>
<body class="bg-gray-100 dark:bg-gray-800">
    <!-- Navbar -->
    

<nav class="bg-white dark:bg-gray-900 w-full z-20 border-b border-gray-200 dark:border-gray-600">
  <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
    <a href="homepage.jsp" class="flex items-center space-x-3 rtl:space-x-reverse">
      <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo">
      <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">ReliefLink</span>
    </a>
    <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
      <% 
      // Check if the user is logged in
      String userId = (String) session.getAttribute("user_id");
      if (userId != null) { 
      %>
        <!-- User ID Link to Profile Page -->
        <div class="flex items-center space-x-4">
          <a href="profilepage.jsp" class="text-gray-900 dark:text-gray-200 font-medium hover:text-blue-700 dark:hover:text-blue-500">
            User ID: <%= userId %>
          </a>
        </div>
      <% } else { %>
        <!-- Login and Register Buttons -->
        <div class="flex items-center">
          <a href="login.jsp" style="margin-right: 16px;" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Login</a>
          <a href="register.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Register</a>
        </div>
      <% } %>
    </div>
    <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
      <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
        <li>
          <a href="homepage.jsp" class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500" aria-current="page">Home</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

    <div class="pt-8">
<!--
        <h1 class="text-3xl text-center font-bold mt-8 text-gray-800 dark:text-gray-200">Welcome to the Navbar Page</h1>
        <p class="text-center text-gray-600 dark:text-gray-400 mt-4">This is a sample page with a responsive navbar using Tailwind CSS.</p>  
-->
 </div>
</body>
</html>
