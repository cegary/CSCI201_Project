<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    
    <script>
    
    function getPosts(){
    	const user = localStorage.getItem("user_id");
    	const s_url = window.location.origin + "/CSCI201_Project/";
    	const url = new URL("ProfileServlet", s_url);
    	url.searchParams.append("user_id", user);
    	fetch(url, {
    		method: "GET",
    	})
		.then(response => response.json())
    	.then(data => {
    			if (data.posts === null || data.posts === undefined) {
    				console.log("empty!!!");
    			}
    			else{
    				print(data.posts);
    			}
    	})
    	.catch(error => {
    		console.log(error);
    	});
    }
    
    
    function print(posts) {
    	posts.forEach(function(post) {
    		let newPost = document.createElement("a");
    		document.getElementById("postContainer").appendChild(newPost);
    		newPost.href = "#";
    		newPost.className = "block bg-white border border-gray-200 rounded-lg shadow-lg p-4 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700 w-full max-w-3xl mx-auto";
    		newPost.innerHTML = post;
    		newPost.style.marginBottom = "30px";
    		
    	});
    	
    }
    
    window.onload = function() {
    	getPosts();
    };
    
	
    
    </script>
    <style>
    #postContainer img{
	    width: 250px;
	    height: auto;
	    margin-right: 10px;
    }
    
    
    
    
    </style>
    <link href="styles/output.css" rel="stylesheet"> <!-- Include Tailwind CSS -->
</head>
<body style="background-color: #D2EDFF;">
    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Page Content -->
    <div class="max-w-screen-xl mx-auto py-8">
        <!-- Blank Space -->
        <div class="mb-6"></div> <!-- 3 lines of blank space -->

        <!-- Page Header -->
        <h1 class="text-3xl font-bold text-center mt-6 mb-6 text-blue-800 dark:text-gray-200">Your Profile</h1>

        <!-- Cards Container -->
        <div id="postContainer" class="space-y-2 mt-3"> <!-- Adds spacing between cards -->

        </div>
    </div>
 
		<a id="create" href="createPost.jsp" 
		   class="fixed bg-blue-500 text-white flex items-center justify-center shadow-lg hover:bg-blue-600 transition"
		   style="width: 64px; height: 64px; bottom: 40px; right: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
		   <span class="font-bold leading-none" style="font-size: 2.5rem; line-height: 1;">+</span>
		</a>
</body>
</html>
