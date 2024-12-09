<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
    <link href="styles/output.css" rel="stylesheet">
</head>
<body style="background-color: #D2EDFF;">
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Main Login Form -->
    <div class="h-screen flex items-center justify-center">
    	<div class="bg-white p-8 rounded-lg shadow-md w-1/3">
	        <h1 class="text-2xl font-bold mb-4 text-center">Login</h1>
	        <form onsubmit="submitLogin(event)" method="post" class="space-y-4">
	            <div>
	                <label for="username" class="block text-sm font-medium text-gray-700">Username:</label>
	                <input type="text" id="username" name="username" required 
	                       class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-blue-500 focus:border-blue-500">
	            </div>
	            <div>
	                <label for="password" class="block text-sm font-medium text-gray-700">Password:</label>
	                <input type="password" id="password" name="password" required 
	                       class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-blue-500 focus:border-blue-500">
	            </div>
	            <div class="text-center">
	                <button type="submit" 
	                        class="bg-blue-500 text-white px-6 py-2 rounded-md hover:bg-blue-600">
	                    Login
	                </button>
	            </div>
	        </form>
	        <div class="mt-4 text-center">
	            <a href="register.jsp" class="text-blue-500 hover:underline">Don't have an account? Register here!</a>
	        </div>
       </div>
    </div>
    <script>
    function submitLogin(event) {
    	event.preventDefault();
    	
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
     

      
     
        const dataSend = new URLSearchParams();
        dataSend.append("username", username);
        dataSend.append("password", password);
        
    	//console.log(payload);

        // Make the fetch request to the RegisterServlet
        const baseURL = window.location.origin + "/CSCI201_Project/";
        const url = baseURL + "LoginServlet";
    	
        // Send the data as a POST request
        fetch(url, {
            method: "POST",
            body: dataSend,
        })
        .then(response => response.json())
        .then(data => {
            // Handle response from the servlet
            if (data.user_id != -1) {
    			localStorage.setItem("user_id", data.user_id);
    			window.location.href = "profilepage.jsp";
            } else {   			
            	alert(JSON.stringify(data));
            }
        })
        .catch(error => {
            console.error(error);
            console.log(error);
        });
    	
    	
    }

    
    </script>
    
    
</body>
</html>