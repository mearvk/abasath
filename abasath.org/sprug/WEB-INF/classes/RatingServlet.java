import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.Date;
import java.sql.*;

public class RatingServlet extends HttpServlet
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
		String username, url;

		Integer rating;

		Date date;

		PreparedStatement statement = null;

		//

		try
		{
			statement = connection.prepareStatement("INSERT INTO Ratings (username, rating, url, date) VALUES(?,?,?,?);");

			//
	
			username = request.getParameter("username");		

			url = request.getParameter("url");

			rating = Integer.parseInt(request.getParameter("rating"));

			date = new Date(System.currentTimeMillis());

			//

			statement.setString(1, username);

			statement.setInt(2, rating);

			statement.setString(3, url);

			statement.setDate(4, date); 

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
