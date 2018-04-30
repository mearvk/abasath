function toggle_chart_div(id, country_code) 
{
    	var div_name = "chart_"+id;

	//

	console.log("toggle_chart_div: trying \""+div_name+"\"");

	//

   	var toggle = document.getElementById(div_name).style.display == "table-row" ? "none" : "table-row";

	//

    	document.getElementById(div_name).style.display = toggle;

	//

	console.log("toggle_chart_div: calling five_day");

    	five_day_intl(id, country_code);

	console.log("toggle_chart_div: five_day returned.");
}

function build_table()
{
	console.log("build_table called...");

	var list = ['London,UK','Reykjavik','Paris,FR','Mumbai,IN','Sao+Paulo,BR','Beijing,CN','Mexico+City,MX','Osaka,JP','Cairo,EG','New+York,US','Amsterdam,NL','Lyon,FR','Delhi,IN','Tokyo,JP'];
						
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

	document.write("<th>latitude + longitude</th>");

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
		xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/weather?q="+list[a]+"&appid=2d35ec638192fdbd36303125180a98cf", false);

		xmlhttp.send();

		//

		var response = xmlhttp.responseText;

		//

		var json = JSON.parse(response);

		if(!json) continue; 
						
		//	

		var country_code = list[a];			
		var lat_lon = json.coord.lat +" : "+ json.coord.lon;
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

                document.write("<td onclick=\"toggle_chart_div("+a+", '"+list[a]+"')\">");

                	document.write("+");

                document.write("</td>");

                document.write("<td>");

                        document.write(a);

                document.write("</td>");

                document.write("<td>");

                        document.write(lat_lon);

                document.write("</td>");

		document.write("<td>");

			document.write(_location);

		document.write("</td>");

                document.write("<td>");

                        document.write(temperature+" F");

                document.write("</td>");

                document.write("<td>");

                      	document.write(weather);

                document.write("</td>");

               	document.write("<td>");

                	document.write(detail);

          	document.write("</td>");
                                                       
		document.write("<td>");

                	document.write(barometer+" mmHg");

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

			document.write("<canvas id=\"canvas_"+country_code+"\" class=\"chartjs-render-monitor\" style=\"\" height=\"100\"></canvas>");

              	document.write("</td>");							
                                                        
		document.write("</tr>");					

	}

		
	document.write("</table>");

	console.log("build_table exited...");
}
