<!DOCTYPE html>

<html style="min-height: 100%;">

    	<head id="head" class="sprug" style="background-color: red;">

       	<title>Sprug Available 1.0</title>

 	<meta charset="utf-8" />

	<!-- -->	

	<link rel="preload" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" as="font">

	<!-- -->

	<i class="fas fa-fire" style="display: none;"></i>

	<i class="fas fa-angle-right" style="display: none;"></i>

<!--	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->

	<link rel="shortcut icon" href="https://www.jqueryscript.net/images/favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Abel|Passion+One:400,700,900|Titillium+Web:200,200i,300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Racing+Sans+One" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700|Saira+Extra+Condensed" rel="stylesheet">

	<link href="./css/base.css" rel="stylesheet">

	<link rel="stylesheet" href="./css/lv-ripple.css">

	<!-- -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>

	<script src="http://abasath.org/sprug/scripts/home.js"></script> 

	<script src="./scripts/yarp.min.js"></script>

	<script>
	
	function respond(event)
	{
		var id = event.id;

		var cs = event.class;

		alert();

		//

		console.log("respond :: "+id+" shows "+document.getElementById(id).getElementsByClassName("subdiv").length+" children");

		//

		if(document.getElementById(id).getElementsByClassName("subdiv")[0].style.display == "none")
		{
			open(event);
		}
		else
		{ 
			close(event);
		}
	}

	function close(event)
	{
		var id = event.id;

		console.log("close :: "+id+" shows "+document.getElementById(id).getElementsByClassName("subdiv").length+" children");

        	for(var a=0; a<document.getElementById(id).getElementsByClassName("subdiv").length; a++)
	        {
	                document.getElementById(id).getElementsByClassName("subdiv")[a].style.display = "none";
	        }
	}

	function open(event)
	{
		var id = event.id;

		console.log("open :: "+id+" shows "+document.getElementById(id).getElementsByClassName("subdiv").length+" children");

	        for(var a=0; a<document.getElementById(id).getElementsByClassName("subdiv").length; a++)
	        {
        	        document.getElementById(id).getElementsByClassName("subdiv")[a].style.display = "block";
	        }
	}

	function shift(event)
	{
		location.href = event.id;
	}
     
	</script>

   	</head>

	<body class="" style="background-color: #040404; margin:0px; padding:0px; background: radial-gradient(at 50% 0%, #222, #111, #070707);">

	<!-- -->

	<div id="header" style="background-color:#040404; height:280px; margin: auto; padding: 10px; box-shadow: 0px 0px 8px #080808; border-radius:5px; border-bottom: black solid 2px; background-image: url('./images/header_052.png'); background-repeat: no-repeat;">


<!--
			<img src="./images/crown.png" style="width: 20px; height: 20px; position: relative; top: 5px;">
-->

			<form id="login" class="form_login" style="width: 100px; display: inline; float:right; margin-right: 10px;">			
	
        		        <select class="sprug_select" name="mode" style="background-color: rgba(30, 30, 30, 0.5); margin-right:5px;">

                                	<option id="" value="standard">Login</option>

                                	<option value="proffect">Settings</option>

  	                	</select>

			</form>


			<p style="font-family: 'Quicksand'; font-variant: small-caps; font-weight: 200; font-size:12px; color: white; display: block; text-shadow: 0px 0px 0px #888; top: 0px; position: relative; top:00px; left: 00px;"><i class="fab fa-envira"></i>&nbsp;&nbsp;sprug research :: vital alignment ahead</p>

			<center>

				<form id="primary" class="form_primary" style="background-color: rgba(30, 30, 40, 0.7); padding: 5px 5px 5px 10px; margin:auto; display:inline-block; text-align: center; position:relative; top:-15px; border-radius: 8px;" action="?">

                                     	<select class="sprug_select" name="mode" style="margin-right:5px;">

                                        	<option value="standard">Standard</option>

                                              	<option value="proffect">Proffect</option>

                                    	</select>
	
					<input name="search" value="Enter Search Terms" onfocus=this.value="" selected="true" type="text" style="color: #999; margin:auto; padding: 3px; width:800px; font-family: 'Quicksand', sans-serif; font-size:10px; border-radius: 5px; border: none; box-shadow: 5px solid black;">

					</input>

					<button class="button">Submit</button>
	
				</form>	

			</center>   

		</div>

<!-- end top search related div -->
