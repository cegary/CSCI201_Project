<body class="bg-gray-100 dark:bg-gray-800">
    <!-- Navbar -->
    <nav class="bg-white dark:bg-gray-900 w-full z-20 border-b border-gray-200 dark:border-gray-600">
        <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-4">
            <a href="homepage.jsp" class="flex items-center space-x-3 rtl:space-x-reverse">
                <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo">
                <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">ReliefLink</span>
            </a>
            <div class="flex md:order-2" id="navbar-actions">
                <!-- Navbar Actions Placeholder -->
            </div>
        </div>
    </nav>

    <script>
        function renderNavbarActions() {
            const userId = localStorage.getItem("user_id"); 
            const navbarActions = document.getElementById("navbar-actions");

            if (!userId) {
                // User is logged out - show Login and Register buttons
                navbarActions.innerHTML = `
                    <a href="login.jsp" 
                       class="mr-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Login
                    </a>
                    <a href="register.jsp" 
                       class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                        Register
                    </a>
                `;
            } else {
                // User is logged in - show Profile and Logout
                navbarActions.innerHTML = `
                    <a href="profilepage.jsp" 
                       class="mr-4 text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-500 dark:hover:bg-blue-600 dark:focus:ring-blue-700">
                        My Profile
                    </a>
                    <button id="logoutButton" 
                            class="text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-500 dark:hover:bg-blue-600 dark:focus:ring-blue-700">
                        Logout
                    </button>
                `;

                // Logout functionality
                document.getElementById("logoutButton").addEventListener("click", function () {
                    localStorage.removeItem("user_id");  // Clear user session
                    renderNavbarActions();               // Refresh the navbar
                });
            }
        }

        // Load navbar actions on page load
        document.addEventListener("DOMContentLoaded", renderNavbarActions);
    </script>
</body>
