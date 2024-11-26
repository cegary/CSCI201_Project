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
    	
    	
    	/* Try to brainstorm multi-threading ideas or add here */
        
        try {
            Connection conn = DriverManager.getConnection(DB_URL);
            String sqlQuery =  "INSERT INTO posts(title, user_id, location, image, resources, details) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, request.getParameter("title"));
            ps.setInt(2, 1); // HARD CODED USER ID, USE LOCAL OR SESSION STORAGE
            ps.setString(3, request.getParameter("location"));
            ps.setBinaryStream(4, request.getPart("image").getInputStream(), request.getPart("image").getSize());
            ps.setString(5, request.getParameter("resources"));
            ps.setString(6, request.getParameter("details"));
            ps.execute();
            
            /*
            PROPER PROCEDURE TO PULL IMAGES (REMOVE AFTER IMPLEMENTING POST PAGE)
 			----------------------------------------
            ResultSet testPrint = ps.executeQuery();
            testPrint.next();
            response.getWriter().println("Entry Added!"); // MUST CHANGE TO REDIRECTION
            byte[] imgBytes = testPrint.getBytes("image");
            response.reset();
            response.getOutputStream().write(imgBytes);
            */
            
            
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
        
    }
}