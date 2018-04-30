$( document ).ready(function(event)
{
        $('.subdiv').yarp({ colors: ['#777'], duration: 350});

        $('.primarydiv').yarp({ colors: ['#777'], duration: 350});

	$('.level2subdiv').yarp({ colors: ['#777'], duration: 350});
});

//

$( document ).ready(function(event)
{		
	$(".subdiv").click( function(event)
	{
		if( event.target.id == "flights.jsp" )
		{
			var toggle = document.getElementById("national_flights.jsp").style.display == "block" ? "none" : "block";

			document.getElementById("national_flights.jsp").style.display = toggle;

			document.getElementById("international_flights.jsp").style.display = toggle;
		}
		else
		{
			setTimeout(function(){window.location.assign(event.target.id);}, 1000);
		}

		return false;
	});
});

//

$( document ).ready(function(event)
{
	$('.menu_item').click( function(event)
	{
		//alert("door");
	
		$( event.target ).parent().trigger("click"); //fire event for subdiv element actually
	});

        $('.primarydiv').click( function(event)
	{
		var length = $( event.target ).parent().children(".subdiv").length;

//		alert( length );

		var prefold;

//		console.log( nodes.length + " children " );

		//
	
		var nodes = $( event.target ).parent().children(".level2subdiv");

		for(var i=0; i<nodes.length; i++)
		{
			var node = nodes[i];

			if( node.style.display == "block" )
			{
				prefold = true;

				node.style.display = "none";
			}
		}

		//

		if( prefold )
		{
			return;
		}

		//

		var nodes = $( event.target ).parent().children(".subdiv");

		for(var i=0; i<nodes.length; i++)
		{
			var node = nodes[i];

			//

			if( node.style.display == "block" ) 	//all 1st level children up;
			{
				node.style.display = "none";
			}
			else 	node.style.display = "block";
		}			
	});
});

//

/*
$( document ).ready(function()
{
	$('.subdiv').yarp({ colors: ['#777'], duration: 350});	

	$('.primarydiv').yarp({ colors: ['#777'], duration: 350});
});
*/

//

$( document ).ready(function() 
{
	var star_count = 5;

	//

	console.log( $(".fa.fa-star").length );

	//

	$(".fa.fa-star").click(function()
	{
		console.log("click detected.");

		//

		var node = $(this);

		var index = node.attr("id");

		var checked = node.hasClass("checked");

		//

		console.log("node was #"+index+" and was " + (checked ? "already checked" : "not yet checked") ); 	

		//

		if(checked && !$("span#"+index).hasClass("checked")) return; //simply return
		
		//	

		var floor_index = Math.floor(index/5);

		console.log("Math mod: "+floor_index);

		var start_index = floor_index * star_count;

		console.log("Start index: "+start_index);

		//

		for(var a=start_index; a<start_index+star_count; a++)
		{
			var _node = $("span#"+a);
		
			if(a<=index)
			{
				_node.addClass("checked");
			}	


			if(a>index)
			{
				_node.removeClass("checked");
			}
		}
	});
});

