import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/CreatePost")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
	maxFileSize = 1024 * 1024 * 10,      // 10 MB
	maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class CreatePost extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";

    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("user_id");
    	// request.getParameter("contact");
    	
    	/* Try to brainstorm multi-threading ideas or add here */
        
        try {
            Connection conn = DriverManager.getConnection(DB_URL);
            String sqlQuery =  "INSERT INTO posts(title, user_id, location, image, contact, description) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, request.getParameter("title"));
            ps.setInt(2, Integer.valueOf(id));
            ps.setString(3, request.getParameter("location"));
            ps.setBinaryStream(4, request.getPart("image").getInputStream(), request.getPart("image").getSize());
            ps.setString(5, request.getParameter("contact"));
            ps.setString(6, request.getParameter("description"));
            ps.execute();
            conn.close();
            response.sendRedirect(request.getContextPath() + "/profilepage.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
        
    }
}