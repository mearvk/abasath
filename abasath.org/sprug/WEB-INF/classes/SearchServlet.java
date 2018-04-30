import java.io.*;

import javax.servlet.*;

import javax.servlet.http.*;

import java.sql.*;

import java.util.*;

import java.util.Arrays;

//

public class SearchServlet extends HttpServlet 
{
	public static final long serialVersionUID = 0x00001;

	String username = "abasatho";

	String password = "J!L7/2lk?d.0r_5$";

	String jdbc = "jdbc:mysql://localhost:3306/abasatho_sprug";

	Connection connection = null;

	//

	public ArrayList<SearchParam> params = new ArrayList<SearchParam>();

	//

	@Override	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
		SearchParam param = null;

		try
		{
			if(request.getParameter("search")==null || request.getParameter("search").isEmpty()) return;

			//

			Class.forName("com.mysql.jdbc.Driver");

			//
		
			param = new SearchParam(request, response);

			//

			this.doParse(param);

			this.doSearch(param);

			this.doMarkup(param);

			this.doRespond(param);
      		}
		catch(Exception e)
		{
			param.writer.print("Exception: "+e);
		} 
		finally 
		{
         		param.writer.close();
      		}
	}

	public void doParse(SearchParam param)
	{
		param.search = param.request.getParameter("search");	

		param.limit = param.request.getParameter("limit");

		param.mode = param.request.getParameter("mode");

		//

		param.query = param.request.getQueryString();

		//

		param.terms = new ArrayList<String>(Arrays.asList(param.request.getQueryString().split("&")));
	}

	public void doSearch(SearchParam param)
	{
		PreparedStatement statement = null;

		ResultSet results = null;

		try
		{
			connection = DriverManager.getConnection(jdbc,username,password);

			//

			statement = connection.prepareStatement("SELECT DISTINCT word, sitename, url, count FROM Histogram001 WHERE word = ? AND count > 1 ORDER BY count DESC");

			statement.setString(1, param.search);

			//
	
			results = statement.executeQuery();

			//

			while(results.next())
			{
				param.urls.add(results.getString("url"));				

				param.sites.add(results.getString("sitename"));

				param.counts.add(results.getInt("count"));
			}

		}
		catch(Exception e)
		{
			param.writer.println(e);
		}
		finally
		{
			try
			{
				connection.close();

				statement.close();
			}
			catch(Exception e)
			{
				param.writer.println(e);
			}

			//

			statement = null;

			connection = null;
		}	
	}

	public void doMarkup(SearchParam param)
	{
		for(int i=0; i<param.urls.size(); i++)
		{
			String open = "<div style=\"border-radius: 5px; padding:0px; margin-top: 20px; margin-bottom: 18px; background-color: #111; \">";

			//

			String sitename = "<div style=\"display: flex; margin: 4px; padding:4px;\">";

			sitename       += "<div style=\"margin-right: 10px; padding: 5px; color:white; background-color:#2f5bd1; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 0 0 100px;\">Site:</div>";

			sitename       += "<div style=\"padding: 5px; color:white; background-color:#222; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 1;\"><a href=\"https://"+param.sites.get(i)+"\">"+param.sites.get(i)+"</a></div>";

			sitename       += "</div>";

			//

			String url 	= "<div style=\"display: flex; margin: 4px; padding:4px;\">";			

			url 	       += "<div style=\"margin-right: 10px; padding: 5px; color: white; background-color:#2f5bd1; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 0 0 100px;\">URL:</div>";

			url 	       += "<div style=\"padding: 5px; color:white; background-color:#222; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 1;\"><a href=\""+param.urls.get(i)+"\">"+param.urls.get(i)+"</a></div>";

			url	       += "</div>";

			//

			String count  	= "<div style=\"display: flex; margin: 4px; padding:4px;\">";

			count	       += "<div style=\"margin-right: 10px; padding: 5px; color: white; background-color:#2f5bd1; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 0 0 100px;\">Count:</div>"; 

			count	       += "<div style=\"padding: 5px; color:white; background-color:#222; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 1;\">"+param.counts.get(i)+"</div>";

			count          += "</div>";

			//

                        String summary  = "<div style=\"display: flex; margin: 4px; padding:4px;\">";

                        summary        += "<div style=\"margin-right: 10px; padding: 5px; color: white; background-color:#2f5bd1; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 0 0 100px;\">Summary:</div>";

                        summary        += "<div style=\"padding: 5px; color:white; background-color:#222; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 1;\">Summary paragraph.</div>";

                        summary        += "</div>";

			//

                        String rating   = "<div style=\"display: flex; margin: 4px; padding:4px;\">";

                        rating         += "<div style=\"margin-right: 10px; padding: 5px; color: white; background-color:#2f5bd1; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 0 0 100px;\">Rating:</div>";

                        rating         += "<div class=\"rating\" style=\"padding: 5px; color:white; background-color:#222; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 1;\">5 stars</div>";

                        rating         += "</div>";

			//

			String rate 	= "<div style=\"display: flex; margin: 4px; padding:4px;\">";

			rate 	       += "<div style=\"margin-right: 10px; padding: 5px; color: white; background-color:#2f5bd1; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 0 0 100px;\">Rate:</div>";

			rate           += "<div class=\"rate\" style=\"padding: 5px; color:white; background-color:#222; font-family: 'Quicksand', sans-serif; border-radius: 5px; flex: 1;\">";

			rate 	       += "<span style=\"padding: 0px; margin: 0px;\" id=\""+(i*5+0)+"\" class=\"fa fa-star\"></span>";

			rate  	       += "<span style=\"padding: 0px; margin: 0px;\" id=\""+(i*5+1)+"\" class=\"fa fa-star\"></span>";

			rate           += "<span style=\"padding: 0px; margin: 0px;\" id=\""+(i*5+2)+"\" class=\"fa fa-star\"></span>";

			rate           += "<span style=\"padding: 0px; margin: 0px;\" id=\""+(i*5+3)+"\" class=\"fa fa-star\"></span>";

			rate           += "<span style=\"padding: 0px; margin: 0px;\" id=\""+(i*5+4)+"\" class=\"fa fa-star\"></span>";

			rate           += "</div>";

			//

			String br = "</br>";

			String close = "</div>";

			//

			String out = open + sitename + url + summary + count + rating + rate + close;

			//

			param.markups.add(out);
		}
	}

	public void doRespond(SearchParam param)
	{
		for(int i=0; i<param.markups.size(); i++)
		{
			param.writer.println(param.markups.get(i));
		}
	}
}

class SearchParam
{
	public SearchParam(HttpServletRequest request, HttpServletResponse response) throws Exception
	{	
		this.request = request;

		this.response = response;

		this.writer = response.getWriter();

		this.response.setContentType("text/html");
	}	

	public ArrayList<String> urls = new ArrayList<String>();

	public ArrayList<Integer> counts = new ArrayList<Integer>();

	public ArrayList<String> sites = new ArrayList<String>();

	public ArrayList<String> terms = new ArrayList<String>();

	public ArrayList<String> markups = new ArrayList<String>();

	public ArrayList<String> links = new ArrayList<String>();

	//

	public String mode = "";

	public String query = "";

	public String search = "";

	public String limit = "";

	public String logics = "";

	public String html = "";

	//

	public HttpServletRequest request;

	public HttpServletResponse response;

	public Exception exception;

	public PrintWriter writer;
}
