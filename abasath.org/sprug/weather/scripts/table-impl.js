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
function build_local_search_results_table(zipcode, include_one_day_chart, include_five_day_chart, div_name)
{
	console.log("build_local_search_results_table called...");

	var list = [zipcode];
						
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

        document.write("<th>expand</th>");

	document.write("<th>populus rank</th>");

	document.write("<th>zipcode</th>");

       	document.write("<th>location</th>");

        document.write("<th>temperature</th>");

        document.write("<th>weather</th>");

        document.write("<th>detail</th>");

        document.write("<th>barometer</th>");

        document.write("<th>wind direction</th>");

        document.write("<th>wind speed</th>");

        document.write("<th>sunrise</th>");

        document.write("<th>sunset</th>");

        document.write("</tr>");

        document.write("</thead>");

	//
							
	for(var a=0; a<list.length; a++)
	{
		xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/weather?zip="+list[a]+",us&appid=2d35ec638192fdbd36303125180a98cf", false);

		xmlhttp.send();

		//

		var response = xmlhttp.responseText;

		//

		var json = JSON.parse(response);

		if(!json) continue; 
						
		//	

		var zipcode = list[a];			
		var temperature = Math.floor(json.main.temp * (9/5) - 459);
		var barometer = json.main.pressure;
		var weather = json.weather[0].main;
		var detail = json.weather[0].description.charAt(0).toUpperCase() + json.weather[0].description.slice(1);
		var wind_speed = json.wind.speed;
		var wind_degree = json.wind.deg;
		var wind_gust = json.wind.gust;
		var _location = json.name +" "+ json.sys.country;					
		var sunrise = new Date(1000*json.sys.sunrise).toUTCString();
		var sunset = new Date(1000*json.sys.sunset).toUTCString();
							
		//

		if(weather == "Clear") weather += "&nbsp;&nbsp;<i class='wi wi-day-sunny'></i>";						

		//

		document.write("<tr id=\""+(a)+"\">");

                document.write("<td onclick=\"toggle_search_div("+a+", "+list[a]+")\">");

                	document.write("+");

                document.write("</td>");

                document.write("<td>");

                        document.write(a);

                document.write("</td>");

                document.write("<td>");

                        document.write(zipcode);

                document.write("</td>");

		document.write("<td>");

			document.write(_location);

		document.write("</td>");

                document.write("<td>");

                        document.write(temperature);

                document.write("</td>");

                document.write("<td>");

                      	document.write(weather);

                document.write("</td>");

               	document.write("<td>");

                	document.write(detail);

          	document.write("</td>");
                                                       
		document.write("<td>");

                	document.write(barometer);

               	document.write("</td>");

                document.write("<td>");

                      	document.write(wind_degree);

           	document.write("</td>");

                document.write("<td>");

                    	document.write(wind_speed);

              	document.write("</td>");
                                                      
		document.write("<td>");

                     	document.write(sunrise);

                document.write("</td>");

                document.write("<td>");

                      	document.write(sunset);

                document.write("</td>");
							
		document.write("</tr>");

		/* end simple weather div 		*/	

		/* start 1 or 5 day weather div 	*/

               	document.write("<tr id=\"chart_search_1d_"+(a)+"\" style=\"\">");

               	document.write("<td colspan='12' style=\"\">");

			document.write("<canvas id=\"canvas_search_1d_"+zipcode+"\" class=\"chartjs-render-monitor\" style=\"background-color: #111\" height=\"100\"></canvas>");

              	document.write("</td>");
		
		document.write("</tr>");

		document.write("<tr id=\"chart_search_5d_"+(a)+"\" style=\"\">");

               	document.write("<td colspan='12' style=\"\">");

			document.write("<canvas id=\"canvas_search_5d_"+zipcode+"\" class=\"chartjs-render-monitor\" style=\"background-color: #111\" height=\"100\"></canvas>");

              	document.write("</td>");						
                                                        
		document.write("</tr>");					

	}
		
	document.write("</table>");

	//1 day weather chart

	if(include_one_day_chart)
	{
		search_results_one_day("canvas_search_1d_"+(zipcode), zipcode);
	}

	//5 day weather chart	

	if(include_five_day_chart)
	{
		search_results_five_day("canvas_search_5d_"+(zipcode), zipcode);
	}

	//

	console.log("build_local_search_results_table exited...");
}

/**
Build out a standard 5 day weather table for local, national, international weather pages.  Loads by default, toggleable by toggle function in this API.
*/
function build_weather_table()
{
	console.log("build_weather_table called...");

	var list = [27278,79936,90011,60629,90650,90201,77084,92335,78521,77449,78572,90280,11226,90805,91331,90044,92336,94565,10467,92683,75052,90210,12345];
						
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

        document.write("<th>expand</th>");

	document.write("<th>populus rank</th>");

	document.write("<th>zipcode</th>");

       	document.write("<th>location</th>");

        document.write("<th>temperature</th>");

        document.write("<th>weather</th>");

        document.write("<th>detail</th>");

        document.write("<th>barometer</th>");

        document.write("<th>wind direction</th>");

        document.write("<th>wind speed</th>");

        document.write("<th>sunrise</th>");

        document.write("<th>sunset</th>");

        document.write("</tr>");

        document.write("</thead>");

	//
							
	for(var a=0; a<list.length; a++)
	{
		xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/weather?zip="+list[a]+",us&appid=2d35ec638192fdbd36303125180a98cf", false);

		xmlhttp.send();

		//

		var response = xmlhttp.responseText;

		//

		var json = JSON.parse(response);

		if(!json) continue; 
						
		//	

		var zipcode = list[a];			
		var temperature = Math.floor(json.main.temp * (9/5) - 459);
		var barometer = json.main.pressure;
		var weather = json.weather[0].main;
		var detail = json.weather[0].description.charAt(0).toUpperCase() + json.weather[0].description.slice(1);
		var wind_speed = json.wind.speed;
		var wind_degree = json.wind.deg;
		var wind_gust = json.wind.gust;
		var _location = json.name +" "+ json.sys.country;					
		var sunrise = new Date(1000*json.sys.sunrise).toUTCString();
		var sunset = new Date(1000*json.sys.sunset).toUTCString();
							
		//

		if(weather == "Clear") weather += "&nbsp;&nbsp;<i class='wi wi-day-sunny'></i>";						

		//

		document.write("<tr id=\""+(a)+"\">");

                document.write("<td onclick=\"toggle_child_div("+a+", "+list[a]+")\">");

                	document.write("+");

                document.write("</td>");

                document.write("<td>");

                        document.write(a);

                document.write("</td>");

                document.write("<td>");

                        document.write(zipcode);

                document.write("</td>");

		document.write("<td>");

			document.write(_location);

		document.write("</td>");

                document.write("<td>");

                        document.write(temperature);

                document.write("</td>");

                document.write("<td>");

                      	document.write(weather);

                document.write("</td>");

               	document.write("<td>");

                	document.write(detail);

          	document.write("</td>");
                                                       
		document.write("<td>");

                	document.write(barometer);

               	document.write("</td>");

                document.write("<td>");

                      	document.write(wind_degree);

           	document.write("</td>");

                document.write("<td>");

                    	document.write(wind_speed);

              	document.write("</td>");
                                                      
		document.write("<td>");

                     	document.write(sunrise);

                document.write("</td>");

                document.write("<td>");

                      	document.write(sunset);

                document.write("</td>");
							
		document.write("</tr>");

		/* end simple weather div 		*/	

		/* start 5 or 16 day weather div 	*/

               	document.write("<tr id=\"chart_"+(a)+"\" style=\"display: none;\">");

               	document.write("<td colspan='12' style=\"\">");

			document.write("<canvas id=\"canvas_"+zipcode+"\" class=\"chartjs-render-monitor\" style=\"\" height=\"100\"></canvas>");

              	document.write("</td>");							
                                                        
		document.write("</tr>");					

	}

		
	document.write("</table>");

	console.log("build_weather_table exited...");
}
