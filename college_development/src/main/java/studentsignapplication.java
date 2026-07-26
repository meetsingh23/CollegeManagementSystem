import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.util.DBconnection;

/**
 * Servlet implementation class studentsignapplication
 */
@WebServlet("/studentsignapplication")
public class studentsignapplication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public studentsignapplication() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = DBconnection.getConnection();
		PrintWriter p=response.getWriter();
		String firstName = request.getParameter("a");
		String lastName = request.getParameter("b");
		String email = request.getParameter("c");
		int pass = Integer.parseInt(request.getParameter("d"));
		String dob=request.getParameter("dob");

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_development", "root", "YOUR MYSQL PASS");

			PreparedStatement pp = connection.prepareStatement(
				"insert into sign values(?,?,?,?,?);"
			);
			pp.setString(1, firstName);
			pp.setString(2, lastName);
			pp.setString(3, email);
			pp.setInt(4, pass);
			pp.setDate(5, java.sql.Date.valueOf(dob));

			pp.execute();
			p.println("Value Inserted");

		} catch (Exception e) {
			p.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
