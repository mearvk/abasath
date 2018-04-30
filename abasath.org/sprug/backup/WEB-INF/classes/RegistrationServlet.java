import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.Date;
import java.sql.*;

public class RegistrationServlet extends HttpServlet
{
        public static final long serialVersionUID = 0x00001;

        String username = "abasatho";

        String password = "J!L7/2lk?d.0r_5$";

        String jdbc = "jdbc:mysql://localhost:3306/abasatho_sprug";

	Connection connection = null;

	//
	
	public void init() throws ServletException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		
			connection = DriverManager.getConnection(jdbc, username, password);
		}
		catch(Exception e)
		{
			throw new ServletException("Unable to initialize");
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
	{
		String username, password;

		Integer salted;

		Date date;

		PreparedStatement statement = null;

		//

		try
		{
			statement = connection.prepareStatement("INSERT INTO Users (username, salted, date) VALUES(?,?,?)");

			//
	
			username = request.getParameter("username");		

			salted = request.getParameter("password").hashCode();

			date = new Date(System.currentTimeMillis());

			//

			statement.setString(1, username);

			statement.setInt(2, salted);

			statement.setDate(3, date); 

			//		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
		finally
		{
			try
			{
				statement.close();
			}
			catch(Exception e)
			{
				//
			}

			try
			{
				connection.close();
			}
			catch(Exception e)
			{
				//
			}	
		}	
	}

	public void destroy()
	{
		//
	}
}
