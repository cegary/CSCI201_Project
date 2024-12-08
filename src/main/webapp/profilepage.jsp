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
<body class="bg-gray-100 dark:bg-gray-800">
    <!-- Navbar -->
    <nav class="bg-white dark:bg-gray-900 w-full z-20 border-b border-gray-200 dark:border-gray-600">
        <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
            <a href="homepage.jsp" class="flex items-center space-x-3 rtl:space-x-reverse">
                <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Logo">
                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">ReliefLink</span>
            </a>
            <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
                <button type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Get started</button>
                <button data-collapse-toggle="navbar-sticky" type="button" class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600" aria-controls="navbar-sticky" aria-expanded="false">
                    <span class="sr-only">Open main menu</span>
                    <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h15M1 7h15M1 13h15"/>
                    </svg>
                </button>
            </div>
            <div class="items-center justify-between hidden w-full md:flex md:w-auto md:order-1" id="navbar-sticky">
                <ul class="flex flex-col p-4 md:p-0 mt-4 font-medium border border-gray-100 rounded-lg bg-gray-50 md:space-x-8 rtl:space-x-reverse md:flex-row md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
                    <li>
                        <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Home</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">About</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Services</a>
                    </li>
                    <li>
                        <a href="#" class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:hover:text-blue-700 md:p-0 md:dark:hover:text-blue-500 dark:text-white dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent dark:border-gray-700">Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

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
</body>
</html>
