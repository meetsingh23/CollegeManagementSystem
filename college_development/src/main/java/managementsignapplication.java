
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
 * Servlet implementation class managementsignapplication
 */
@WebServlet("/managementsignapplication")
public class managementsignapplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public managementsignapplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter p=response.getWriter();
		Connection con = DBconnection.getConnection();
		String uid=request.getParameter("a");
		String uname=request.getParameter("b");
		int pass=Integer.parseInt(request.getParameter("c"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_development", "root", "meetsingh");
            PreparedStatement pp=connection.prepareStatement("insert into management values(?,?,?);");
            pp.setString(1, uid);
            pp.setString(2, uname);
            pp.setInt(3, pass);
            pp.execute();
            p.println("Value Inserted");
            }catch(Exception e) {
			p.println(e);
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
