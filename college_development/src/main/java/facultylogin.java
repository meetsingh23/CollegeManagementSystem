
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class facultylogin
 */
@WebServlet("/facultylogin")
public class facultylogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facultylogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter obj=response.getWriter();
		String m=request.getParameter("a");
		int n=Integer.parseInt(request.getParameter("b"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_development", "root", "meetsingh");
	        PreparedStatement pp=connection.prepareStatement("select * from faculty where id=? and password=?");
	        pp.setString(1, m);
            pp.setInt(2, n);
	        ResultSet rs=pp.executeQuery();
	        boolean b=rs.next();
	        if(b) {
	        	response.sendRedirect("thankyou.jsp");
	        	}else {
	        		response.sendRedirect("error.jsp");
	        }
		}catch(Exception e) {
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
