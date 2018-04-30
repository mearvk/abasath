<html>

	<link href="./css/weather-icons.css" rel="stylesheet" type="text/css" media="all">

	<link href="./css/weather-icons-wind.css" rel="stylesheet" type="text/css" media="all">

<!--
	<link rel="preload" href="./fonts/weathericons-regular-webfont.woff2" as="font"> 

	<link rel="preload" href="./fonts/weathericons-regular-webfont.woff" as="font"> 

	<link rel="preload" href="./fonts/weathericons-regular-webfont.ttf" as="font">

-->
	
	<jsp:include page="../header.jsp" />

	<jsp:include page="../menu.jsp" />

	<div id="//hotels/international" style="position: relative; top: 5px; min-height:1000px; flex:0; border-radius: 5px; overflow:hidden; overflow-y: auto; background-color:#111; font-family:Quicksand; background-repeat: no-repeat;">

		<div style="border-bottom: 0px solid #111; margin: auto; width: 1300px; background-color: #333; clip-path: polygon(0 0, 100% 0, 85% 100%, 15% 100%); shape-margin: 20px;">&nbsp;</div>

		<div style="margin-left:20px; margin-right: 20px; background-color: rgba(30,30,30,1.0); height: 100%; position:relative; top: 40px; height: 800px; padding: 10px;">

	                <div class="pageheader" style="display:block; z-index:1;">

				<p style="display: inline;"><i class="fas fa-angle-double-right"></i>&nbsp;Search Settings:</p>

        	        </div>

                        <div class="page" style="display:block; z-index:1; padding:5px; border-radius: 5px 5px 5px 5px;">

	                        <p style="display: inline;"><i class="fas fa-angle-double-right"></i>&nbsp;Options:</p>

				<div style="background-color: #2b2b2b;">

					<div style="background-color: #2b2b2b; min-height:70px; padding: 20px; ">

						<i class="wi wi-night-sleet" style="font-size: 20px; color: #aaa;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:20px;'>&nbsp;International options:</p></i>
						<form style="" style="">

							<div style="display: flex; padding: 10px; margin:10px; flex-direction: column;">

								<div style="flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;">
	
									<div style="border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;">

										<i class="fab fa-cloudsmith"></i>&nbsp; Zip code:

									</div>

									<div style="border-radius: 5px; height: 20px; flex:8;  margin: 10px; padding: 5px;">

										<input type="text" name="zipcode"></input>									

									</div>

								</div>

                                                                <div style="flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;">

                                                                        <div style="border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;">

                	                                                        <i class="fab fa-cloudsmith"></i>&nbsp; City:

									</div>

                	                                                <div style="border-radius: 5px; height: 20px; flex:8; margin: 10px; padding: 5px;">
		
        	                                                                <input type="text" name="city"></input>
	
                        	                                        </div>

								</div>

                                                                <div style="flex: 1; display: flex; padding: 10px; margin:10px; flex-direction: row;">

                                                                        <div style="border-radius: 5px; height: 20px; flex:1; background-color: #222; margin: 10px; padding: 5px;">

                        	                                                <i class="fab fa-cloudsmith"></i>&nbsp; Country code:

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

                                        <div style="background-color: #2b2b2b; margin-top: 10px; height:800px; padding: 20px;">

<i class="wi wi-night-sleet" style="font-size: 20px; color: #aaa;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:20px;'>&nbsp;International report:</p></i>

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

</html>
