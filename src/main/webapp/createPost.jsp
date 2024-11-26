<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Resource Post</title>
    <link href="styles/output.css" rel="stylesheet"> <!-- Link to Tailwind CSS -->
</head>
<body class="min-h-screen flex items-center justify-center bg-gradient-to-b from-blue-100 to-blue-200">
    <!-- Centered Box -->
    <div class="bg-white dark:bg-gray-900 rounded-lg shadow-lg p-8 w-full max-w-3xl">
        <h1 class="text-3xl font-bold text-center mb-6 text-blue-800 dark:text-gray-200">Create a Resource Posting</h1>
        <form action="PostResourceServlet" method="post" enctype="multipart/form-data" class="space-y-6">
            <!-- Item Name -->
            <div>
                <label for="itemName" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Title</label>
                <input type="text" id="itemName" name="itemName" placeholder="Enter the name of the item" required
                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200">
            </div>

            <!-- Location -->
            <div>
                <label for="location" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Location</label>
                <input type="text" id="location" name="location" placeholder="Enter the location" required
                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200">
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
                <input type="file" id="photos" name="photos" accept="image/*" multiple
                    class="mt-1 block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 dark:border-gray-700 dark:bg-gray-800 dark:text-gray-200">
                <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">You can upload multiple images (e.g., JPEG, PNG).</p>
            </div>

            <!-- Submit Button -->
            <div class="text-center">
                <button type="submit"
                    class="bg-blue-600 text-white px-6 py-2 rounded-md font-medium hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                    Post Resource
                </button>
            </div>
        </form>
    </div>
</body>
</html>
