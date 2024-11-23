import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//TEST COMMENT
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";

    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            Connection conn = DriverManager.getConnection(DB_URL);
            String sqlQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sqlQuery);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery(); 
            boolean valid = true;
            
            //Checking for Username matches
            while(rs.next()){
            	 if(rs.getString("username").equals(user)) { valid = false; break; }
            }
            
            //Handling Post-Verification Response
            if (valid) {
            	sqlQuery = "INSERT INTO users VALUES (?,?)";
            	ps = conn.prepareStatement(sqlQuery);
            	ps.setString(1, user);
                ps.setString(2, pass);
                response.getWriter().println("Registration Successful!");
            } 
            else {
                response.getWriter().println("Username already registered.");
            }
            
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}

