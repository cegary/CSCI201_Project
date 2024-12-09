import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Base64;
import java.util.ArrayList;
import com.google.gson.Gson;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";

    @Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("user_id");
        String search_type = "";
        search_type = request.getParameter("search_type");
        String search_content = "";
        search_content = request.getParameter("search_content");
        System.out.println("search_type: " + search_type);
        System.out.println("search_content; " + search_content);
        
        try {
        	Connection conn = DriverManager.getConnection(DB_URL);
        	String sqlQuery = "";
        	if (search_type == null) 
        	{
        		sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users on posts.user_id=users.id ORDER BY posts.post_id DESC";
        	}
        	else if (search_type.compareTo("1") == 0)
        	{ //hello
        		System.out.println("SQL QUERY 1");
        		sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users "
        				+ "on posts.user_id=users.id WHERE title ='" + search_content + "' ORDER BY posts.post_id DESC";
        		//sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users on posts.user_id=users.id ORDER BY posts.post_id DESC";
        	}	
        	else if (search_type.compareTo("2") == 0)
        	{
        		System.out.println("SQL QUERY 2");
//        		sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users "
//        				+ "on posts.user_id=users.id WHERE location ='" + search_content + "'";
        		sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users "
        				+ "on posts.user_id=users.id WHERE location ='" + search_content + "' ORDER BY posts.post_id DESC";
        	}
        	else if (search_type.compareTo("3") == 0)
        	{
        		System.out.println("SQL QUERY 3");
//        		sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users "
//        				+ "on posts.user_id=users.id WHERE users.username ='" + search_content + "'";
        		sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users "
        				+ "on posts.user_id=users.id WHERE users.username ='" + search_content + "' ORDER BY posts.post_id DESC";
        	}
        	System.out.println("SQL: " + sqlQuery);
        	PreparedStatement ps = conn.prepareStatement(sqlQuery);
        	ResultSet rs = ps.executeQuery();
        	String posts = "{\"posts\":[";
        	while(rs.next()){
        		byte[] img = rs.getBytes("image");
        		String b64img = Base64.getEncoder().encodeToString(img);
        		String src = "data:image/jpeg;base64," + b64img; 
        		posts += "["
        				+ "\""+ rs.getString("title")+"\","
        				+ "\"" +rs.getString("location") + "\","
        				+ "\"" + src + "\","
        				+ "\"" + rs.getString("contact") + "\","
        				+ "\""+ rs.getString("description") + "\","
        				+ "\""+ rs.getString("username") + "\""
        				+ "],";
        	}
        	posts = posts.substring(0, posts.length()-1);
        	posts += "]}";
        	response.getWriter().write(posts);
        	
        	conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}

