<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <script>
    
    function display(){
    	const user = localStorage.getItem("user_id");
    	const s_url = window.location.origin + "/CSCI201_Project/";
    	const url = new URL("HomeServlet", s_url);
    	url.searchParams.append("user_id", user);
    	fetch(url, {
    		method: "GET",
    	})
		.then(response => response.json())
    	.then(data => {
    		console.log(data);
    		[...data.posts].forEach(function(p){
    			print(p[5], p[0], p[1], p[3], p[4], p[2]);
    		});
    	})
    	.catch(error => {
    		console.log(error);
    	});
    }
    
    
    function print(usr, title, loc, contact, desc, src) {
    	
    	let newPost = document.createElement("div");
    	newPost.className = "bg-white dark:bg-gray-900 shadow-md rounded-lg p-4 w-full mx-auto"; 
    	newPost.style="max-width: 64rem; height: auto;";
    	let post = "<h2 class=\"text-xl font-bold text-gray-800 dark:text-white\">" + title + "</h2>\n"
    		+ "                <p class=\"text-sm text-gray-600 dark:text-white\">" + usr + "</p>\n"
    		+ "                <p class=\"mt-4 text-gray-800 dark:text-white\">\n"
    		+ "                    "+desc+"\n"
    		+ "                </p>\n"
    		+ "                <div class=\"mt-4\">\n"
    		+ "                    <p class=\" mb-6 text-sm text-gray-500 dark:text-white\">Contact: "+ contact +"</p>\n"
    		+ "                    <div class=\"flex space-x-3 rtl:space-x-reverse mt-2\">\n"
    		+ "                        <img src=\""+src+"\" class=\"w-32 h-32 object-cover rounded\">\n"
    		+ "                        <div class=\"w-full h-full bg-gray-200 dark:bg-gray-700 flex items-center justify-center rounded\">\n"
    		+ "          			   		<iframe\n"
    		+ "                    			class=\"rounded-lg border border-gray-300 shadow-sm w-full h-full\"\n"
    		+ "                   			src=\"https://www.google.com/maps/embed/v1/place?key=AIzaSyCUPIxY9VDROwKBoqtVBezEqp9Y3d6-BsM&q=" + loc + "\"\n"
    		+ "                    			loading=\"lazy\"\n"
    		+ "                    			allowfullscreen\n"
    		+ "                				></iframe>\n"
    		+ "                        </div>\n"
    		+ "                    </div>\n"
    		+ "                </div>\n"
    		+ "                <div class=\"flex items-center justify-between mt-4\">\n"
    		+ "                    <button class=\"text-gray-600 dark:text-gray-400 hover:text-blue-500\">\n"
    		+ "                        ❤️\n"
    		+ "                    </button>\n"
    		+ "                    <button class=\"text-gray-600 dark:text-gray-400 hover:text-blue-500\">\n"
    		+ "                        💬\n"
    		+ "                    </button>\n"
    		+ "                </div>\n";
    	newPost.innerHTML = post;
    	document.getElementById("pc").appendChild(newPost);
    }
    
    window.onload = function() {
    	display();
    };
    
    </script>
    <link href="styles/output.css" rel="stylesheet"> <!-- Include Tailwind CSS -->
    <style>
    #pc img{
    width: 300px;
    height: auto;
    }
    </style>
</head>
<body style="background-color: #D2EDFF;">

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Main Content -->
    <div class="pt-20 max-w-screen-xl mx-auto px-4">
    
      <!-- Page Header -->
        <h1 class="text-3xl font-bold text-center mt-6 mb-6 text-blue-800 dark:text-gray-200">Home</h1>

        <!-- Scrollable Feed -->
        <div id="pc" class="space-y-4">
            <!-- Example Post 
            <div class="bg-white dark:bg-gray-900 shadow-md rounded-lg p-4 w-full mx-auto" style="max-width: 32rem; height: auto;"> 
                <h2 class="text-xl font-bold text-gray-800 dark:text-white">Example Post</h2>
                <p class="text-sm text-gray-600 dark:text-white">Username</p>
                <p class="mt-4 text-gray-800 dark:text-white">
                    Text here
                </p>
                <div class="mt-4">
                    <p class="text-sm text-gray-500 dark:text-white">Location: Address here</p>
                    <div class="flex space-x-3 rtl:space-x-reverse mt-2">
                        <img src="example-photo.jpg" class="w-32 h-32 object-cover rounded">
                        <img src="example-photo2.jpg" class="w-32 h-32 object-cover rounded">
                        <div class="w-16 h-16 bg-gray-200 dark:bg-gray-700 flex items-center justify-center rounded">
                            <a href="#" class="text-sm text-blue-600 dark:text-white">Google Maps API</a>
                        </div>
                    </div>
                </div>
                <div class="flex items-center justify-between mt-4">
                    <button class="text-gray-600 dark:text-gray-400 hover:text-blue-500">
                        ❤️
                    </button>
                    <button class="text-gray-600 dark:text-gray-400 hover:text-blue-500">
                        💬
                    </button>
                </div>
            </div>
			
            <!-- Repeat the above block for more posts -->
        </div>
    </div>
    
		<!-- Create Post Floating Button -->
		<script>
		    document.addEventListener("DOMContentLoaded", function () {
		        // Check if the user is logged in
		        const userId = localStorage.getItem("user_id"); // Retrieve user_id from localStorage
		        const redirectPage = userId ? "createPost.jsp" : "login.jsp"; // Decide redirect page
		
		        // Create the floating button dynamically
		        const floatingButton = document.createElement("a");
		        floatingButton.href = redirectPage;
		        floatingButton.className = "fixed bg-blue-500 text-white flex items-center justify-center shadow-lg hover:bg-blue-600 transition";
		        floatingButton.style.width = "64px";
		        floatingButton.style.height = "64px";
		        floatingButton.style.bottom = "40px";
		        floatingButton.style.right = "40px";
		        floatingButton.style.borderRadius = "50%";
		        floatingButton.style.display = "flex";
		        floatingButton.style.alignItems = "center";
		        floatingButton.style.justifyContent = "center";
		
		        floatingButton.innerHTML = `
		            <span class="font-bold leading-none" style="font-size: 2.5rem; line-height: 1;">+</span>
		        `;
		
				floatingButton.addEventListener("click", function (event) { 
					event.preventDefault();
					if (!userId) { 
						alert("You must be logged in to create a post!"); 
						} 
						window.location.href = redirectPage; });
		        // Append the button to the DOM
		        document.body.appendChild(floatingButton);
		    });
		</script>


</body>
</html>