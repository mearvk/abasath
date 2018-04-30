<html>

	<link href="./css/weather-icons.css" rel="stylesheet" type="text/css" media="all">

	<link href="./css/weather-icons-wind.css" rel="stylesheet" type="text/css" media="all">

	<script src="./scripts/Chart.bundle.js"></script>

	<script src="./scripts/chart-impl-intl.js"></script>

	<script src="./scripts/table-impl-intl.js"></script>

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

					<i class="wi wi-night-sleet" style="font-size: 08px; color: #fff; margin: 4px;"><p style='display: inline; font-family:Quicksand; font-weight: 400; font-size:08px; border-radius: 15px 5px 15px 5px;'>&nbsp;international report:</p></i>

        				</div>

                                        <div style="background-color: #121212; min-height:800px; margin:1px; padding: 1px; background-color: none;">

						<script>

						build_table();

						</script>

                                        </div>

                                </div>
			
				<!-- end content div -->
	
		</div>

        </div>	

</html>

