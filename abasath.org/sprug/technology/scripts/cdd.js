/**
@author: Max Rupplin
@version: 1.0
@see: http://abasath.org/sprug/weather/national.jsp

Functional API for weather related charts.
*/

/**
Click toggle chart expansion as part of simple local, national, international weather charts.
*/
function toggle_search_div(id, zipcode) 
{
	var cdd_prefix = "";

    	var div_name_1d = "chart_search_1d_"+id;

    	var div_name_5d = "chart_search_5d_"+id;

	//

	console.log("toggle_chart_div toggles \""+div_name_1d+"\"");

	console.log("toggle_chart_div toggles \""+div_name_5d+"\"");

	//

   	var toggle_1d = document.getElementById(div_name_1d).style.display == "table-row" ? "none" : "table-row";

   	var toggle_5d = document.getElementById(div_name_5d).style.display == "table-row" ? "none" : "table-row";

	//

    	document.getElementById(div_name_1d).style.display = toggle_1d;	

    	document.getElementById(div_name_5d).style.display = toggle_5d;
}

/**
Click toggle chart expansion as part of simple local, national, international weather charts.
*/
function toggle_child_div(id, zipcode) 
{
    	var div_name = "chart_"+id;

	//

	console.log("toggle_chart_div toggles \""+div_name+"\"");

	//

   	var toggle = document.getElementById(div_name).style.display == "table-row" ? "none" : "table-row";

	//

    	document.getElementById(div_name).style.display = toggle;

	//

	one_day(id, zipcode);
}

/**
Build weather table, include two divs for weather charts, daily and 5 day respectively.
*/
function build_local_search_results_table(search_term, include_tier1_results, include_tier2_results, div_name)
{
	console.log("build_local_search_results_table called...");

	var list = ["1","2","3"];
						
	var xmlhttp;

	if (window.XMLHttpRequest) 
	{
		// code for modern browsers
    		xmlhttp = new XMLHttpRequest();
 	} 
	else 
	{
	    	// code for old IE browsers
    		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	//

        document.write("<table class='cdd_table' style='width:100%; color: #fff; border-collapse: separate; border-spacing: 2px;'>");

        document.write("<thead class='cdd_thead' style='padding: 10px; margin: 10px;'>");

       	document.write("<tr>");

        document.write("<th>expand</th>");

	document.write("<th>search rank</th>");

	document.write("<th>title</th>");

       	document.write("<th>summary</th>");

        document.write("<th>link</th>");

        document.write("</tr>");

        document.write("</thead>");

	//
							
	for(var a=0; a<list.length; a++)
	{
		//xmlhttp.open("GET", "", false);

		//xmlhttp.send();

		//

		//var response = xmlhttp.responseText;

		//

		//var json = JSON.parse(response);

		//if(!json) continue; 
						
		//	

		var search = list[a];			
							
		//

		//

		document.write("<tr id=\""+(a)+"\">");

                document.write("<td onclick=\"toggle_search_div("+a+", "+list[a]+")\">");

                	document.write("+");

                document.write("</td>");

                document.write("<td>");

                        document.write(a);

                document.write("</td>");

                document.write("<td>");

                        document.write("name of document");

                document.write("</td>");

		document.write("<td>");

			document.write("circuit driven design 1.0");

		document.write("</td>");

                document.write("<td>");

                        document.write("<a href=''>link</a>");

                document.write("</td>");

		document.write("</tr>");

		/* end simple weather div 		*/	

		/* start 1 or 5 day weather div 	*/

               	document.write("<tr id=\"chart_search_1d_"+(a)+"\" style=\"\">");

               	document.write("<td colspan='12' style=\"\">");

			document.write("<canvas id=\"canvas_search_tier1_"+search_term+"\" class=\"chartjs-render-monitor\" style=\"background-color: #111\" height=\"100\"></canvas>");

              	document.write("</td>");
		
		document.write("</tr>");

		document.write("<tr id=\"chart_search_tier2_"+(a)+"\" style=\"\">");

               	document.write("<td colspan='12' style=\"\">");

			document.write("<canvas id=\"canvas_search_tier2_"+search_term+"\" class=\"chartjs-render-monitor\" style=\"background-color: #111\" height=\"100\"></canvas>");

              	document.write("</td>");						
                                                        
		document.write("</tr>");					

	}
		
	document.write("</table>");

	//1 day weather chart

	if(include_tier1_results)
	{
		search_results_tier1("canvas_search_tier1_"+(search_term), search_term);
	}

	//5 day weather chart	

	if(include_tier2_results)
	{
		search_results_tier2("canvas_search_tier2_"+(search_term), search_term);
	}

	//

	console.log("build_local_search_results_table exits...");
}

/**
Build out a standard 5 day weather table for local, national, international weather pages.  Loads by default, toggleable by toggle function in this API.
*/
function build_cdd_table()
{
	console.log("build_cdd_table called...");

	var list = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
						
	var xmlhttp;

	if (window.XMLHttpRequest) 
	{
		// code for modern browsers
    		xmlhttp = new XMLHttpRequest();
 	} 
	else 
	{
	    	// code for old IE browsers
    		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	//

        document.write("<table class='weather_table' style='width:100%; color: #fff; border-collapse: separate; border-spacing: 2px;'>");

        document.write("<thead class='weather_thead' style='padding: 10px; margin: 10px;'>");

       	document.write("<tr>");

        document.write("<th style=\"width:100px\">expand</th>");

	document.write("<th style=\"width:100px\">search rank</th>");

	document.write("<th style=\"width:250px\">title</th>");

       	document.write("<th style=\"width:*\">summary</th>");

        document.write("<th style=\"width:200px\">link</th>");

        document.write("</tr>");

        document.write("</thead>");

	//
							
	for(var a=0; a<list.length; a++)
	{
		//xmlhttp.open("GET", "http://abasath.org/cdd/search/SearchServlet?popularity="+a, false);

		//xmlhttp.send();

		//

		//var response = xmlhttp.responseText;

		//

		//var json = JSON.parse(response);

		//if(!json) continue; 
						
		//	

		var search_term = list[a];		
		var rank = a;
		var title = "title";
		var summary = "summary";
		var link = "link";		
		
							
		//

		document.write("<tr id=\""+(a)+"\">");

                document.write("<td style=\"width:50px\" onclick=\"toggle_child_div("+a+", "+list[a]+")\">");

                	document.write("+");

                document.write("</td>");

                document.write("<td>");

                        document.write(a);

                document.write("</td>");

                document.write("<td>");

                        document.write(title);

                document.write("</td>");

		document.write("<td>");

			document.write(summary);

		document.write("</td>");

                document.write("<td>");

                        document.write(link);

                document.write("</td>");

		document.write("</tr>");

		/* end simple cdd table build 		*/	
	}

		
	document.write("</table>");

	console.log("build_cdd_table exits...");
}

