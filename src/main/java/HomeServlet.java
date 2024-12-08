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
        try {
        	Connection conn = DriverManager.getConnection(DB_URL);
        	String sqlQuery = "SELECT title, location, image, contact, description, users.username FROM posts LEFT JOIN users on posts.user_id=users.id ORDER BY posts.post_id DESC";
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

