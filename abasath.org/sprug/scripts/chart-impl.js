function json_item()
{
        var date;
        var temperature;
        var pressure;
};

function search_results_one_day(div_name, zipcode) 
{
	console.log("One day forecast loading...");

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

	xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/forecast?zip="+zipcode+"&appid=2d35ec638192fdbd36303125180a98cf&cnt=9", false);

	xmlhttp.send();

	//

	var response = xmlhttp.responseText;

	//

	var json = JSON.parse(response);

	//

	console.log("JSON survived: "+(json!=null));	
	
	//

	var json_items = new Array();

	var index = 0;

	var item;

	//

	JSON.parse(response, (key, value) => 
	{
		if(key.valueOf() == "dt".valueOf())
		{	
			json_items[index] = new json_item();
		}

		if(key.valueOf() == "temp".valueOf())
		{
			json_items[index].temperature = value;
		}

        	if(key.valueOf() == "pressure".valueOf())
        	{
                	json_items[index].pressure = value;
        	}

        	if(key.valueOf() == "dt_txt".valueOf())
        	{
                	json_items[index].date = value;

                	index++;
        	}
	});

	//

	console.log("Item count: "+(json_items.length));

	//

	console.log("div_name specified as: "+div_name);

	console.log("zipcode specified as: "+zipcode);

    	var ctx = document.getElementById("canvas_search_1d_"+(zipcode)).getContext('2d');

	//

	config1d.options.title.text = "One Day Forecast";

	for(var i=0; i<json_items.length; i++)
	{
		config1d.data.labels[i] = json_items[i].date;

		config1d.data.datasets[0].data[i] = Math.floor(json_items[i].temperature * (9/5) - 459);

		config1d.data.datasets[1].data[i] = json_items[i].pressure;
	}

	//

    	window.myLine = new Chart(ctx, config1d);

	//

	console.log("One day forecast exiting...");
};

function one_day(div_name, zipcode) 
{
	console.log("One day forecast loading...");

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

	xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/forecast?zip="+zipcode+"&appid=2d35ec638192fdbd36303125180a98cf&cnt=9", false);

	xmlhttp.send();

	//

	var response = xmlhttp.responseText;

	//

	var json = JSON.parse(response);

	//

	console.log("JSON survived: "+(json!=null));	
	
	//

	var json_items = new Array();

	var index = 0;

	var item;

	//

	JSON.parse(response, (key, value) => 
	{
		if(key.valueOf() == "dt".valueOf())
		{	
			json_items[index] = new json_item();
		}

		if(key.valueOf() == "temp".valueOf())
		{
			json_items[index].temperature = value;
		}

        	if(key.valueOf() == "pressure".valueOf())
        	{
                	json_items[index].pressure = value;
        	}

        	if(key.valueOf() == "dt_txt".valueOf())
        	{
                	json_items[index].date = value;

                	index++;
        	}
	});

	//

	console.log("Item count: "+(json_items.length));

	//

	console.log("div_name specified as: "+div_name);

	console.log("zipcode specified as: "+zipcode);

    	var ctx = document.getElementById("canvas_"+(zipcode)).getContext('2d');

	//

	config1d.options.title.text = "One Day Forecast";

	for(var i=0; i<json_items.length; i++)
	{
		//Math.floor(json.main.temp * (9/5) - 459)

		config1d.data.labels[i] = json_items[i].date;

		config1d.data.datasets[0].data[i] = Math.floor(json_items[i].temperature * (9/5) - 459);

		config1d.data.datasets[1].data[i] = json_items[i].pressure;
	}

	//


    	window.myLine = new Chart(ctx, config1d);

	//

	console.log("One day forecast exiting...");
};

function search_results_five_day(div_name, zipcode) 
{
	console.log("Five day search results forecast loading...");

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

	xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/forecast?zip="+zipcode+"&appid=2d35ec638192fdbd36303125180a98cf", false);

	xmlhttp.send();

	//

	var response = xmlhttp.responseText;

	//

	var json = JSON.parse(response);

	//

	console.log("JSON survived: "+(json!=null));	
	
	//

	var json_items = new Array();

	var index = 0;

	var item;

	//

	JSON.parse(response, (key, value) => 
	{
		if(key.valueOf() == "dt".valueOf())
		{	
			json_items[index] = new json_item();
		}

		if(key.valueOf() == "temp".valueOf())
		{
			json_items[index].temperature = value;
		}

        	if(key.valueOf() == "pressure".valueOf())
        	{
                	json_items[index].pressure = value;
        	}

        	if(key.valueOf() == "dt_txt".valueOf())
        	{
                	json_items[index].date = value;

                	index++;
        	}
	});

	//

	console.log("Item count: "+(json_items.length));

	//

	console.log("div_name specified as: "+div_name);

	console.log("zipcode specified as: "+zipcode);

    	var ctx = document.getElementById("canvas_search_5d_"+(zipcode)).getContext('2d');

	//

	config5d.options.title.text = "Five Day Forecast";

	for(var i=0; i<json_items.length; i++)
	{
		config5d.data.labels[i] = json_items[i].date;

		config5d.data.datasets[0].data[i] = Math.floor(json_items[i].temperature * (9/5) - 459);

		config5d.data.datasets[1].data[i] = json_items[i].pressure;
	}

	//

    	window.myLine = new Chart(ctx, config5d);

	//

	console.log("Five day search results forecast exiting...");
};

function five_day(div_name, zipcode) 
{
	console.log("Five day forecast loading...");

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

	xmlhttp.open("GET", "https://api.openweathermap.org/data/2.5/forecast?zip="+zipcode+"&appid=2d35ec638192fdbd36303125180a98cf", false); 

	xmlhttp.send();

	//

	var response = xmlhttp.responseText;

	//

	var json = JSON.parse(response);

	//

	console.log("JSON survived: "+(json!=null));	
	
	//

	var json_items = new Array();

	var index = 0;

	var item;

	//

	JSON.parse(response, (key, value) => 
	{
		if(key.valueOf() == "dt".valueOf())
		{	
			json_items[index] = new json_item();
		}

		if(key.valueOf() == "temp".valueOf())
		{
			json_items[index].temperature = value;
		}

        	if(key.valueOf() == "pressure".valueOf())
        	{
                	json_items[index].pressure = value;
        	}

        	if(key.valueOf() == "dt_txt".valueOf())
        	{
                	json_items[index].date = value;

                	index++;
        	}
	});

	//

	console.log("Item count: "+(json_items.length));

	//

	console.log("div_name specified as: "+div_name);

	console.log("zipcode specified as: "+zipcode);

    	var ctx = document.getElementById("canvas_"+(zipcode)).getContext('2d');

	//	

	config5d.options.title.text = "Five Day Forecast";

	for(var i=0; i<json_items.length; i++)
	{
		config5d.data.labels[i] = json_items[i].date;

		config5d.data.datasets[0].data[i] = Math.floor(json_items[i].temperature * (9/5) - 459);

		config5d.data.datasets[1].data[i] = json_items[i].pressure;
	}

	//

    	window.myLine = new Chart(ctx, config5d);

	//

	console.log("Five day forecast exiting...");
}



var config1d = {
    type: 'line',
    data: {
        labels: ['04-18-2018', '04-19-2018', '04-20-2018', '04-21-2018', '04-22-2018', '04-23-2018', '04-24-2018'],
        datasets: [{
            label: 'Temperature',
            backgroundColor: 'rgb(101, 33, 14)',
            borderColor: 'rgb(121, 43, 24)',
            yAxisID: 'Temperature',
            data: [
                52,
                56,
                46,
                88,
                92,
                24,
                24
            ],
            fill: false,
        }, {
            label: 'Barometric Pressure',
            fill: false,
            backgroundColor: 'rgb(120, 120, 120)',
            borderColor: 'rgb(100, 100, 100)',
            yAxisID: 'Barometer',
            data: [
                720,
                660,
                760,
                780,
                720,
                1140,
                1240
            ],
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: true,
        title: {
            display: true,
            text: '5 Day Weather'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Date'
                }
            }],
            yAxes: [{
                id: 'Temperature',
                type: 'linear',
                position: 'left',
            }, {
                id: 'Barometer',
                type: 'linear',
                position: 'right',
            }]
        }
    }
};

var config5d = {
    type: 'line',
    data: {
        labels: ['04-18-2018', '04-19-2018', '04-20-2018', '04-21-2018', '04-22-2018', '04-23-2018', '04-24-2018'],
        datasets: [{
            label: 'Temperature',
            backgroundColor: 'rgb(101, 33, 14)',
            borderColor: 'rgb(121, 43, 24)',
            yAxisID: 'Temperature',
            data: [
                52,
                56,
                46,
                88,
                92,
                24,
                24
            ],
            fill: false,
        }, {
            label: 'Barometric Pressure',
            fill: false,
            backgroundColor: 'rgb(120, 120, 120)',
            borderColor: 'rgb(100, 100, 100)',
            yAxisID: 'Barometer',
            data: [
                720,
                660,
                760,
                780,
                720,
                1140,
                1240
            ],
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: true,
        title: {
            display: true,
            text: '5 Day Weather'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Date'
                }
            }],
            yAxes: [{
                id: 'Temperature',
                type: 'linear',
                position: 'left',
            }, {
                id: 'Barometer',
                type: 'linear',
                position: 'right',
            }]
        }
    }
};

var config = {
    type: 'line',
    data: {
        labels: ['04-18-2018', '04-19-2018', '04-20-2018', '04-21-2018', '04-22-2018', '04-23-2018', '04-24-2018'],
        datasets: [{
            label: 'Temperature',
            backgroundColor: 'rgb(101, 33, 14)',
            borderColor: 'rgb(121, 43, 24)',
            yAxisID: 'Temperature',
            data: [
                52,
                56,
                46,
                88,
                92,
                24,
                24
            ],
            fill: false,
        }, {
            label: 'Barometric Pressure',
            fill: false,
            backgroundColor: 'rgb(120, 120, 120)',
            borderColor: 'rgb(100, 100, 100)',
            yAxisID: 'Barometer',
            data: [
                720,
                660,
                760,
                780,
                720,
                1140,
                1240
            ],
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: true,
        title: {
            display: true,
            text: '5 Day Weather'
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: 'Date'
                }
            }],
            yAxes: [{
                id: 'Temperature',
                type: 'linear',
                position: 'left',
            }, {
                id: 'Barometer',
                type: 'linear',
                position: 'right',
            }]
        }
    }
};
