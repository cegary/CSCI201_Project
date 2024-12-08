<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Navbar with Create Resource Form</title>
    <link href="styles/output.css" rel="stylesheet"> <!-- Include Tailwind CSS -->
    <script async src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBTVVROXxFzkX8e2RVIn6G5raIe6hwJ7rw&loading=async&libraries=maps"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-800">
    <!-- Navbar -->
    <nav class="bg-white dark:bg-gray-900 w-full z-20 border-b border-gray-200 dark:border-gray-600">
        <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
            <a href="https://flowbite.com/" class="flex items-center space-x-3 rtl:space-x-reverse">
                <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo">
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
                        <a href="#" class="block py-2 px-3 text-white bg-blue-700 rounded md:bg-transparent md:text-blue-700 md:p-0 md:dark:text-blue-500" aria-current="page">Home</a>
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
    
    <!-- Content Area -->
    <div class="pt-8 px-4">
        <!-- Extra Blank Space -->
        <br><br><br>

        <div class="bg-white dark:bg-gray-900 rounded-lg shadow-lg p-8 w-full max-w-3xl mx-auto">
            <h1 class="text-3xl font-bold text-center mb-6 text-blue-800 dark:text-gray-200">Create a Resource Posting</h1>
            <form action="CreatePost" method="post" enctype="multipart/form-data" class="space-y-6">
                <!-- Item Name -->
                <div>
                    <label for="itemName" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Title</label>
                    <input type="text" id="itemName" name="title" placeholder="Enter the name of the item" required
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200">
                </div>

                <!-- Location -->
                <div>
                	<label for="location" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Location</label>
                	<div id="mapBox"></div>
   					<input id="location" type="hidden" name="location">
                    
                </div>

                <!-- Description -->
                <div>
                    <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Description</label>
                    <textarea id="description" name="description" rows="4" placeholder="Provide a detailed description of the item"
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200"></textarea>
                </div>

                <!-- Contact Information -->
                <div>
                    <label for="contact" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Contact Information</label>
                    <input type="text" id="contact" name="contact" placeholder="Enter your contact details" required
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200">
                </div>

                <!-- Photo Upload -->
                <div>
                    <label for="photos" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Upload Photos</label>
                    <input type="file" id="photos" name="image" accept="image/*" multiple
                        class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200">
                    <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">You can upload an image (e.g., JPEG, PNG).</p>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit"
                        class="bg-blue-600 text-white px-6 py-2 rounded-md font-medium hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                        Post Resource
                    </button>
                </div>
                <input type="hidden" value="" name="user_id" id="user_id">
            </form>
        </div>
    </div>
    <script>
    /*
    
    https://maps.googleapis.com/maps/api/geocode/json?latlng=" + + "&key=AIzaSyBTVVROXxFzkX8e2RVIn6G5raIe6hwJ7rw
    https://www.google.com/maps/embed/v1/place?key=AIzaSyCUPIxY9VDROwKBoqtVBezEqp9Y3d6-BsM&q= ;
    
    */
    
    
    window.onload = () => {
    	document.getElementById("user_id").value = localStorage.getItem("user_id");
    	let mapBox = document.getElementById("mapBox");
    	mapBox.style.height = "300px";
    	mapBox.style.width = "auto";
    	mapBox.style.border = "2px solid #000";
    	const position = { lat: 34.021333, lng: -118.28325 }; 
    	

    	map = new google.maps.Map(document.getElementById("mapBox"), {
        	zoom: 16,
        	center: position,
    	    mapControlOptions: {
            position: google.maps.ControlPosition.TOP_CENTER,
            style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
        	}
      	});
      	
      	let marker = new google.maps.Marker({
    	    map: map,
    	    position: position,
    	    title: "USC",
    	    optimized: false,
    	});
    	
    	map.addListener('click', function(e) {
    		
    		marker.setPosition({lat: e.latLng.lat(), lng: e.latLng.lng()});
    		
    		let gc = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + e.latLng.lat() + "," + e.latLng.lng() + "&key=AIzaSyBTVVROXxFzkX8e2RVIn6G5raIe6hwJ7rw";
    		fetch(gc, {method: "GET"})
    		.then(response => response.json())
    		.then(data => {
    			document.getElementById("location").value = escape(data.results[0].formatted_address);
    			
    			
    		})
    		.catch(error => { console.log(error); });
    		
    		
    		
    	});
    	return;
    };
    </script>
</body>
</html>
