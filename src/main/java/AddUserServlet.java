import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";

    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        boolean adding = false;

        try {
            Connection conn = DriverManager.getConnection(DB_URL);
            String sqlQuery = "SELECT id FROM users WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery(); 
            
            //Verification & Response
            if (!rs.next()) {
            	sqlQuery = "INSERT INTO users(username, password) VALUES (?,?)";
            	ps = conn.prepareStatement(sqlQuery);
            	ps.setString(1, user);
                ps.setString(2, pass);
                adding = true; // Avoiding "empty result set" exception
                ps.executeQuery();
            } 
            else {
                response.getWriter().println("Username already registered."); // MUST CHANGE TO REDIRECTION
            }
            
            conn.close();
        }
        catch (Exception e) {
            if(!adding){
            	e.printStackTrace();
            	response.getWriter().println("An error occurred: " + e.getMessage());
            }
        }
        
        if(adding) {
        	response.getWriter().println("Registration Successful!"); // MUST CHANGE TO REDIRECTION
        }
    }
}

