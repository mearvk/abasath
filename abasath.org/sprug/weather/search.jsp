<html>

	<link href="./css/weather-icons.css" rel="stylesheet" type="text/css" media="all">

	<link href="./css/weather-icons-wind.css" rel="stylesheet" type="text/css" media="all">

	<!-- -->
	
	<jsp:include page="../header.jsp" flush="true"/>

	<jsp:include page="../menu.jsp" flush="true"/>

	<jsp:include page="../subheader.jsp" flush="true"/>

	<div id="" style="position: relative; top: 5px; min-height:1000px; flex:0; border-radius: 5px; overflow:hidden; overflow-y: hidden; background-color:#111; font-family:Quicksand; background-repeat: no-repeat;">

		<div style="margin-left:0px; margin-right: 0px; position:relative; top: 10px; min-height: 800px; padding: 10px;">

	                <div class="pageheader" style="display:block; z-index:1;">

				<p style="display: inline;"></p>

        	        </div>

                        <div class="page" style="display:block; z-index:1; padding:5px; border-radius: 5px 5px 5px 5px;">

	                        <p style="display: inline;"></p>

				<div style="background-color: #111;">

					<div style="background-color: #131313; min-height:70px; padding: 20px; ">

						<i class="wi wi-night-sleet" style="font-size: 12px; color: #aaa;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:12px;'>&nbsp;Search Options:</p></i>
						<form style="" style="">

							<div style="display: flex; padding: 10px; margin:10px; flex-direction: column;">

								<div style="flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;">
	
									<div style="border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;">

										<span style="background-color:#1a1b1c; padding: 5px; padding-right: 7px; padding-left:7px; border-top: 1px solid #383838;
border-bottom: 1px solid #151515; border-right: #202020;"><i class="fab fa-cloudsmith" style="color:#800000;"></span></i>&nbsp; Zip Code:

									</div>

									<div style="border-radius: 5px; height: 20px; flex:8;  margin: 10px; padding: 5px;">

										<input type="text" name="zipcode"></input>									

									</div>

								</div>

                                                                <div style="flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;">

                                                                        <div style="border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;">

                	                                                        <span style="background-color:#1a1b1c; padding: 5px; padding-right: 7px; padding-left:7px; border-top: 1px solid #383838;
border-bottom: 1px solid #151515; border-right: #202020;"><i class="fab fa-cloudsmith" style="color:#800000;"></span></i>&nbsp; City:

									</div>

                	                                                <div style="border-radius: 5px; height: 20px; flex:8; margin: 10px; padding: 5px;">
		
        	                                                                <input type="text" name="city"></input>
	
                        	                                        </div>

								</div>

                                                                <div style="flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;">

                                                                        <div style="border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;">

                        	                                                <span style="background-color:#1a1b1c; padding: 5px; padding-right: 7px; padding-left:7px; border-top: 1px solid #383838;
border-bottom: 1px solid #151515; border-right: #202020;"><i class="fab fa-cloudsmith" style="color:#800000;"></span></i>&nbsp; Country Code:

									</div>

                                                                	<div style="border-radius: 5px; height: 20px; flex:8; margin: 10px; padding: 5px;">

                                                                        	<input type="text" name="country"></input>

                                                                	</div>

								</div>

							</div>

						</form>

					</div>
				</div>

                                <div style="background-color: #222;">

                                        <div style="background-color: #121212; margin-top: 10px; height:800px; padding: 20px;">

<i class="wi wi-night-sleet" style="font-size: 12px; color: #aaa;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:12px;'>&nbsp;Local Report:</p></i>

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
					
	
							document.write("<div style='display: flex; padding: 10px; margin:10px; flex-direction: column;'>");

							document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp; Location:</div>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+loc+"</div>");
							document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Sunrise:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+sunrise+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Sunset:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+sunset+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Weather:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+weather+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Description:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+description+"</div>");
                                                        document.write("</div>");

							document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Temp:</div>");
								document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+temp+"</div>");
							document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Barometric:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+pressure+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Wind Speed:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+wind_speed+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Wind Degree:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+wind_degree+"</div>");
                                                        document.write("</div>");

                                                        document.write("<div style='flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;'>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;'><i class='fab fa-cloudsmith'></i>&nbsp;Wind Gust:</div>");
                                                                document.write("<div style='border-radius: 5px; height: 20px; flex:8; background-color: #222; margin: 10px; padding: 5px;'>"+wind_gust+"</div>");
                                                        document.write("</div>");

							document.write("</div>");

							//alert(temp);

						</script>

                                        </div>

                                </div>
	
                        </div>

		</div>

        </div>

	</body>

</html>
