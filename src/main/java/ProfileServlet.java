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

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:postgresql://aws-0-us-west-1.pooler.supabase.com:5432/postgres?user=postgres.olisivusijyhootkipzo&password=disaster_relief201";

    @Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("user_id");
        ArrayList<String> posts = new ArrayList<>();
        try {
        	Connection conn = DriverManager.getConnection(DB_URL);
        	String sqlQuery = "SELECT title, location, image, contact, description FROM posts WHERE user_id = ?";
        	PreparedStatement ps = conn.prepareStatement(sqlQuery);
        	ps.setInt(1, Integer.valueOf(id)); 
        	ResultSet rs = ps.executeQuery();
        	
        	while(rs.next()){
        		byte[] img = rs.getBytes("image");
        		String b64img = Base64.getEncoder().encodeToString(img);
        		String src = "data:image/jpeg;base64," + b64img;
        		String input = "<div class=\"flex flex-col items-center md:flex-row\">\n"
        	    		+ "        <img class=\"w-48 h-32 rounded-lg object-cover\" src=\"" + src + "\" alt=\"Resource Image\">\n"
        	    		+ "        <div class=\"ml-12 flex flex-col justify-between w-full\"> <!-- Increased margin-left to 12 -->\n"
        	    		+ "            <h5 class=\"text-2xl font-bold tracking-tight text-gray-900 dark:text-white\">" + rs.getString("title") + "</h5>\n"
        	    		+ "            <p class=\"text-gray-700 dark:text-gray-400 mt-2\">Description: " + rs.getString("description") + "</p>\n"
        	    		+ "            <p class=\"text-sm text-gray-500 dark:text-gray-300\">Contact: " + rs.getString("contact") + "</p>\n"
        	    		+ "			   <div class=\"mt-4\">\n"
        	    		+ "                <iframe\n"
        	    		+ "                    class=\"rounded-lg border border-gray-300 shadow-sm w-full h-48\"\n"
        	    		+ "                    src=\"https://www.google.com/maps/embed/v1/place?key=AIzaSyCUPIxY9VDROwKBoqtVBezEqp9Y3d6-BsM&q=" + rs.getString("location") + "\"\n"
        	    		+ "                    loading=\"lazy\"\n"
        	    		+ "                    allowfullscreen\n"
        	    		+ "                </iframe>\n"
        	    		+ "            </div>\n"
        	    		+ "        </div>\n"
        	    		+ "    </div>\n";
        		posts.add(input);
        	}
        	Gson gson = new Gson();
        	String json = gson.toJson(posts);
        	response.getWriter().write("{\"posts\":" + json + "}");
        	
        	conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}

