<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Page</title>
    <link href="styles/output.css" rel="stylesheet">
    <script>
    	function toProfile(e){
    		e.preventDefault();
    		const s_url = window.location.origin + "/CSCI201_Project/";
        	const url = new URL("AddUserServlet", s_url);
        	params = new URLSearchParams();
            params.append("username", document.getElementById("username").value);
            params.append("password", document.getElementById("password").value);
        	fetch(url, {
        		method: "POST",
        		body: params
        	})
    		.then(response => response.json())
        	.then(data => {
        			if (data.user_id) {
        				localStorage.setItem("user_id", data.user_id);
        				window.location.href = "profilepage.jsp";
        			}
        			else alert("Registration failed. Please try again.");
        	})
        	.catch(error => {
        		console.log(error);
        	});
    		
    	}
    </script>
</head>
<body class="bg-gray-100 h-screen flex flex-col">
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Main Registration Form -->
    <div class="h-screen flex items-center justify-center">
	    <div class="bg-white p-8 rounded-lg shadow-md w-1/3">
	        <h1 class="text-2xl font-bold mb-4 text-center">Register</h1>
	        <form onsubmit="toProfile(event);" class="space-y-4">
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
	                    Register
	                </button>
	            </div>
	        </form>
	    </div>
    </div>
</body>
</html>
