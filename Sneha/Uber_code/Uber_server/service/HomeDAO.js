var mysqlconn = require('../config/mysqlconn');

var homeDAO = {
		
		
		createPost : function(msg, callback){
			
			var res = {};
			var insertStatement = "insert into TEST_TABLE  values  ('" + msg.post +"');";
			
			console.log("Query is:"+insertStatement);
			
			mysqlconn.fetchData(function(err,results){
				if(err){
					res.code = "401";
					res.value = "Failed Signup";
				}else{
					res.code = "200";
					res.value = "Succes Signup";
				}
				callback(null, res);
			},insertStatement);
		
		}

}



module.exports.homeDAO = homeDAO;
