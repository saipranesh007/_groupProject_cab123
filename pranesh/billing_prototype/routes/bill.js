exports.generateBill = function ( req, res){
	//Fetching values from front end
	var driverName = req.param("driver");
	var distance   = req.param("distance");
	var time       = req.param("time");
	var carType    = req.param("carType");
	
	//Converting the date from 06:50:21 GMT-0800 (PST) to  0650:21 GMT-0800 (PST)
	var date = new Date().toTimeString().replace(':','');
	
	//Fetching the first 4 values to fetch the current time.
	var time = date.substring(0,4);
	
	//variables required to determine the final price.
	var carPrice  ;
	var timeFactor = 1 ;
	var surgeFactor = 1 ;
	var totalPrice;
	
	// These values must be fetched based on Map and from the database.
	var noOfCars = 15 ;
	var noOfCustomers = 24 ;
	
	//Console log's to display the input values.
	console.log("Driver name is " + driverName);
	console.log("Distance is " + distance);
	console.log("Time is " + time);
	console.log("Car type is " + carType);
	
	// Setting the car price based on km's traveled
	switch (carType) {
	case "bc":
		carPrice = 6;
		break;
	case "mc":
		carPrice = 4;
		break;
	case "sc":
		carPrice = 2;
		break;
	default:
		console.log(" some err");
		break;
	}
	
	//Checking whether the time is between 12:00 am and 6:00 am
	if(time > 0 && time < 600  ){
		timeFactor = 2;
	}
	
	//checking the surge factor by means of number of cars and number of customers available at a particular screen
	if(noOfCars <= noOfCustomers/2){
		surgeFactor = 2;
	}
	//checking the values in the console.
	console.log("carPrice is " + carPrice + " - Distance is "+ distance +
			" - timeFactor is" + timeFactor + " - surgeFactor is "+ surgeFactor);
	totalPrice = carPrice * distance * timeFactor * surgeFactor ;
	
	//rounding up the decimal places to two digits
	console.log(Math.round(totalPrice * 100) / 100);
	
}