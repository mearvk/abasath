<html>

	<link href="./css/weather-icons.css" rel="stylesheet" type="text/css" media="all">

	<link href="./css/weather-icons-wind.css" rel="stylesheet" type="text/css" media="all">

	<script src="./scripts/Chart.bundle.js"></script>

	<script src="./scripts/chart-impl.js"></script>

	<script src="./scripts/table-impl.js"></script>

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

        <div id="" class="header" style="background-color: #555; position: relative; display: none; background: radial-gradient(at 50% 0%, #222, #181818, #111); border-top: 1px solid #202020; border-bottom: 1px solid #111; border-radius: 5px 5px 5px 5px; position:relative; margin-bottom: 04px; padding: 4px;">

<i class="wi wi-night-sleet" style="font-size: 08px; color: #fff; margin: 4px;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:08px; border-radius: 15px 5px 15px 5px;'>&nbsp;hotels</p></i>

        </div>

	<div style="radial-gradient(at 50% 0%, #222, #181818, #111); border-top: 1px solid #202020; border-bottom: 1px solid #111; border-radius: 5px 5px 5px 5px; position:relative; margin-bottom: 04px; padding: 4px;"">

		<form>

			<label style="font-family:Quicksand; font-size: 10px; margin-left: 10px; margin-right: 10px; font-variant: small-caps;">search: </label>

			<input name="zipcode" class="sprug_select" type="text" style="background-color:#444;" value="enter zipcode" onclick="this.value='';"></input>

			<button class="button">Go!</button>

		</form>

	</div>

	<%
	String zipcode = null;

	if(request.getParameter("zipcode")==null) 
	{
		zipcode = "90210";
	}
 
	if(request.getParameter("zipcode")!=null)
	{
		zipcode = (String)request.getParameter("zipcode");

		out.println("<div style=\"font-family:Quicksand; font-size: 10px; font-variant: small-caps;\">");
	
			out.println("<script>");

			out.println("	build_local_search_results_table("+zipcode+",true,true,\"guess\");");

			out.println("</script>");
		
		out.println("</div>");
	}
	%>
                                        </div>

                                </div>
			
				<!-- end content div -->
	
		</div>

        </div>	

</html>

