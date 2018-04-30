<html>

	<link href="./css/weather-icons.css" rel="stylesheet" type="text/css" media="all">

	<link href="./css/weather-icons-wind.css" rel="stylesheet" type="text/css" media="all">

	<!-- -->
	
	<jsp:include page="../header.jsp" />

	<jsp:include page="../menu.jsp" />

	<jsp:include page="../subheader.jsp" flush="true"/>

	<div id="" style="position: relative; top: 5px; min-height:1000px; flex:0; border-radius: 5px; overflow:hidden; overflow-y: auto; background-color:none; font-family:Quicksand; background-repeat: no-repeat;">

			<!-- start empty div -->

			<!-- end empty div -->

			<!-- start content div -->

                        <div class="page" style="display:block; z-index:1; padding:5px; border-radius: 5px 5px 5px 5px; margin: 0px;">

				<!-- end search options -->

				<!-- start national weather -->

                                <div style="margin:5px;">

        <div id="" class="header" style="background-color: #555; position: relative; display: none; background: radial-gradient(at 50% 0%, #222, #181818, #111); border-top: 1px solid #202020; border-bottom: 1px solid #111; border-ra
dius: 5px 5px 5px 5px; position:relative; margin-bottom: 08px;">

<i class="wi wi-night-sleet" style="font-size: 05px; color: #fff; margin: 20px;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:12px; border-radius: 15px 5px 15px 5px;'>&nbsp;system theory:</p></i>

        </div>

                                        <div style="background-color: #121212; min-height:800px; margin:1px; padding: 1px; background-color: none;">

						<script>
						
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

							xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/weather?zip=27278,us&appid=2d35ec638192fdbd36303125180a98cf", false);

							xmlhttp.send();

							//

							var response = xmlhttp.responseText;

							//alert(response);

		

							var json = JSON.parse(response);
							
							var temp = Math.floor(json.main.temp * (9/5) - 459);
							var pressure = json.main.pressure;
							var weather = json.weather[0].main;
							var description = json.weather[0].description.charAt(0).toUpperCase() + json.weather[0].description.slice(1);
							var wind_speed = json.wind.speed;
							var wind_degree = json.wind.deg;
							var wind_gust = json.wind.gust;
							var loc = json.name +" "+ json.sys.country;					
							var sunrise = new Date(1000*json.sys.sunrise).toUTCString();
							var sunset = new Date(1000*json.sys.sunset).toUTCString();
							
							//

							if(weather == "Clear") weather += "&nbsp;&nbsp;<i class='wi wi-day-sunny'></i>";						

							//
					
	
							document.write("<div style='display: flex; padding: 0px; margin:0px; flex-direction: column;'>");

							document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 4px;'><i class='fab fa-cloudsmith'></i>&nbsp; Location:</div>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 4px;'>"+loc+"</div>");
							document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 4px;'><i class='fab fa-cloudsmith'></i>&nbsp;Sunrise:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 4px;'>"+sunrise+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 4px;'><i class='fab fa-cloudsmith'></i>&nbsp;Sunset:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+sunset+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 4px;'><i class='fab fa-cloudsmith'></i>&nbsp;Weather:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+weather+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 4px;'><i class='fab fa-cloudsmith'></i>&nbsp;Description:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+description+"</div>");
                                                        document.write("</div>");

							document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 4px;'><i class='fab fa-cloudsmith'></i>&nbsp;Temperature:</div>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+temp+"</div>");
							document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Barometric:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+pressure+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Wind Speed:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+wind_speed+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Wind Degree:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+wind_degree+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 0px; margin:0px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #65210E; margin: 4px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Wind Gust:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:12; background-color: #222; margin: 4px; padding: 5px;'>"+wind_gust+"</div>");
                                                        document.write("</div>");

							document.write("</div>");

							//alert(temp);

						</script>

                                        </div>

                                </div>
			
				<!-- end content div -->
	
		</div>

        </div>

</html>
