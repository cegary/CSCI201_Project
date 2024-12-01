<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page import="java.sql.* , java.util.Base64" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Profile Page</title>
</head>
<body>
    <ul>
    <% 
String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";
Connection conn = DriverManager.getConnection(DB_URL);
String sqlQuery = "SELECT title, location, image, resources, details FROM posts WHERE user_id = ?";
PreparedStatement ps = conn.prepareStatement(sqlQuery);
ps.setInt(1, 1); 
ResultSet rs = ps.executeQuery();



while(rs.next()){
	byte[] img = rs.getBytes("image");
	String b64img = Base64.getEncoder().encodeToString(img);
	String src = "data:image/jpeg;base64," + b64img;
	out.println("<a href=\"#\" class=\"block bg-white border border-gray-200 rounded-lg shadow-lg p-4 hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700 w-full max-w-3xl mx-auto\">\n"
    		+ "    <div class=\"flex flex-col items-center md:flex-row\">\n"
    		+ "        <img class=\"w-48 h-32 rounded-lg object-cover\" src=\"" + src + "\" alt=\"Resource Image\">\n"
    		+ "        <div class=\"ml-12 flex flex-col justify-between w-full\"> <!-- Increased margin-left to 12 -->\n"
    		+ "            <h5 class=\"text-2xl font-bold tracking-tight text-gray-900 dark:text-white\">" + rs.getString("title") + "</h5>\n"
    		+ "            <p class=\"text-gray-700 dark:text-gray-400 mt-2\">" + rs.getString("resources") + "</p>\n"
    		+ "            <p class=\"text-sm text-gray-500 dark:text-gray-300 mt-2\">Location: " + rs.getString("location") + "</p>\n"
    		+ "            <p class=\"text-sm text-gray-500 dark:text-gray-300\">Contact: EMPTY FOR NOW!</p>\n"
    		+ "        </div>\n"
    		+ "    </div>\n"
    		+ "	</a>");
	
}

conn.close();
%>
    </ul>
</body>
</html>
