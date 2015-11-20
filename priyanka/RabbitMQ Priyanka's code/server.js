var amqp = require('amqp')
, util = require('util');

var handler = require('./services/requestHandler');
var user = require('./services/serverUser');
var cnn = amqp.createConnection({host:'127.0.0.1'});

cnn.on('ready', function(){
//	console.log("listening on myQueue");
	cnn.queue('myQueue', function(q){
		q.subscribe(function(msgPayload, headers, deliveryInfo, m){
//			util.log(util.format( deliveryInfo.routingKey, msgPayload));
			util.log("Message: " + JSON.stringify(msgPayload));
//			util.log("DeliveryInfo: " + JSON.stringify(deliveryInfo));
				handler.handleRequest(msgPayload, function(err, res){
					cnn.publish(m.replyTo, res, {
						contentType:'application/json',
						contentEncoding:'utf-8',
						correlationId:m.correlationId
					});
				});
		});
	});
});
