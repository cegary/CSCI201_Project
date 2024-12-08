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
                <!-- Placeholder for Username -->
                <div id="usernameDisplay" class="text-blue-900 dark:text-blue-200 font-medium hover:text-blue-700 dark:hover:text-blue-500">
                    Loading username...
                </div>
                <script>
                    function getUsernameFromLocalStorage() {
                        const userId = localStorage.getItem("user_id"); // Get user ID from localStorage
                        console.log("Stored user_id:", userId); // Debugging localStorage value

                        if (!userId) {
                            document.getElementById("usernameDisplay").innerHTML = `
                                <a href="login.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Login</a>
                                <a href="register.jsp" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Register</a>
                            `;
                            return;
                        }

                        const s_url = window.location.origin + "/CSCI201_Project/";
                        const url = new URL("UserDetailsServlet", s_url);
                        url.searchParams.append("user_id", userId);

                        console.log("Fetching username for user_id:", userId);

                        fetch(url, { method: "GET" })
                            .then(response => response.json())
                            .then(data => {
                                console.log("Response data:", data); // Debug response
                                const username = String(data.username || "").trim();
                                console.log("Sanitized username:", username);

                                if (username) {
                                    document.getElementById("usernameDisplay").innerHTML = `
                                        <a href="profilepage.jsp" class="text-blue-900 dark:text-blue-200 font-medium hover:text-blue-700 dark:hover:text-blue-500">
                                            My Profile
                                        </a>
                                    `;
                                } else {
                                    console.error("Username not found:", data);
                                    document.getElementById("usernameDisplay").textContent = "User";
                                }
                            })
                            .catch(error => {
                                console.error("Error fetching username:", error);
                                document.getElementById("usernameDisplay").textContent = "User";
                            });
                    }

                    // Ensure DOM is loaded before running the script
                    document.addEventListener("DOMContentLoaded", function () {
                        getUsernameFromLocalStorage();
                    });
                </script>
            </div>
        </div>
    </nav>
</body>
</html>
