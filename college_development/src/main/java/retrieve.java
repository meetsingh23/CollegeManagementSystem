
import java.sql.*;

import com.util.DBconnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class retrieve
 */
@WebServlet("/retrieve")
public class retrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrieve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        Connection con = DBconnection.getConnection();
        PrintWriter obj = response.getWriter();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_development","root","YOUR OWN SQL PASSWORD");
            String table = request.getParameter("table");
            if (table == null || table.equals("")) {
                table = "sign";
            }
            PreparedStatement p = connection.prepareStatement("select * from " + table);
            ResultSet rs = p.executeQuery();
            obj.println("<html>");
            obj.println("<head><title>Display</title></head>");
            obj.println("<body>");
            if (table.equals("sign")) {
                obj.println("<h2>Student Details</h2>");
            } else if (table.equals("faculty")) {
                obj.println("<h2>Faculty Details</h2>");
            } else if (table.equals("management")) {
                obj.println("<h2>Management Details</h2>");
            }
            obj.println("<table border='1' cellpadding='10'>");
            obj.println("<tr>");
            obj.println("<th>User ID</th>");
            obj.println("<th>Password</th>");
            obj.println("</tr>");
            while (rs.next()) {
                String user;
                String password;
                if (table.equals("sign")) {
                    user = rs.getString("first_name");
                    password = rs.getString("pass");
                } else {
                    user = rs.getString("id");
                    password = rs.getString("password");
                }
                obj.println("<tr>");
                obj.println("<td>" + user + "</td>");
                obj.println("<td>" + password + "</td>");
                obj.println("</tr>");
            }
            obj.println("</table>");
            obj.println("</body>");
            obj.println("</html>");
            rs.close();
            p.close();
            connection.close();
        } catch (Exception e) {
            obj.println(e);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
