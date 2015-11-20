var amqp = require('amqp')
, util = require('util');

var homeDAO = require('./service/HomeDAO')

var cnn = amqp.createConnection({host:'127.0.0.1'});

cnn.on('ready', function(){
	console.log("listening on queue");
	
	cnn.queue('create_post_queue', function(q){
		q.subscribe(function(message, headers, deliveryInfo, m){
			util.log("Message: "+JSON.stringify(message));
			homeDAO.homeDAO.createPost(message, function(err,res){

				//return index sent
				cnn.publish(m.replyTo, res, {
					contentType:'application/json',
					contentEncoding:'utf-8',
					correlationId:m.correlationId
				});
			});
		});
	});

});