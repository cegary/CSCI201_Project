import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";

    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	String user = request.getParameter("username");
        String pass = request.getParameter("password");
        
        try {
            Connection conn = DriverManager.getConnection(DB_URL);
            String sqlQuery = "SELECT id FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
            	response.getWriter().write("{\"user_id\":" + rs.getInt("id") + "}");
            } 
            else {
                response.getWriter().println("{\"user_id\":-1}");
            }
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("{\"user_id\":-1}");
        }
    }
}

