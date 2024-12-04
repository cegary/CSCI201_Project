<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <link href="styles/output.css" rel="stylesheet"> <!-- Include Tailwind CSS -->
</head>
<body class="bg-gray-100 dark:bg-gray-800">

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Main Content -->
    <div class="pt-20 max-w-screen-xl mx-auto px-4">

        <!-- Scrollable Feed -->
        <div class="space-y-4">
            <!-- Example Post -->
            <div class="bg-white dark:bg-gray-900 shadow-md rounded-lg p-4 w-full !max-w-md mx-auto !h-60"> <!-- Adjust width and height -->
                <h2 class="text-xl font-bold text-gray-800 dark:text-white">Title</h2>
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
</body>
</html>
