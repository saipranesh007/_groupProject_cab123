var user = require('./serverUser');

exports.handleRequest = function (msgPayload, callback) {
	
	var reqType = msgPayload.reqType;	
	
	switch(reqType) {
		case "signUp":
			console.log("Server: routing to sign up");
			user.signUp(msgPayload, callback);
			break;
		case "login":
			user.login(msgPayload, callback);
			break;
		case "viewProfile":
			user.viewProfile(msgPayload, callback);
			break;
		case "logout":
			user.logout(msgPayload, callback);
			break;
		case "addPost":
			user.addPost(msgPayload, callback);
			break;
		case "getPosts":
			user.getPosts(msgPayload, callback);
			break;
		case "getFriends":
			user.getFriends(msgPayload, callback);
			break;
		case "getUserGroups":
			user.getUserGroups(msgPayload, callback);
			break;		
		case "getGuestProfile":
			user.getGuestProfile(msgPayload, callback);
			break;
		case "search":
			user.search(msgPayload, callback);
			break;
		case "addFriend":
			user.addFriend(msgPayload, callback);
			break;
		case "getGroupInfo":
			user.getGroupInfo(msgPayload, callback);
			break;
		case "getNotifications":
			user.getNotifications(msgPayload, callback);
			break;		
		case "deleteRequest":
			user.deleteRequest(msgPayload, callback);
			break;
		case "isFriend":
			user.isFriend(msgPayload, callback);
			break;
		case "getFeed":
			user.getFeed(msgPayload, callback);
			break;
		case "refreshProfile":
			console.log("Server: routing to refreshProfile");
			user.refreshProfile(msgPayload, callback);
			break;
		case "acceptRequest":
			user.acceptRequest(msgPayload, callback);
			break;			
		case "deleteGroup":
			user.deleteGroup(msgPayload, callback);
			break;
		case "joinGroup":
			user.joinGroup(msgPayload, callback);
			break;
		case "leaveGroup":
			user.leaveGroup(msgPayload, callback);
			break;
		case "createGroup":
			user.createGroup(msgPayload, callback);
			break;
		case "getNotifications":
			user.getNotifications(msgPayload, callback);
			break;	
		case "getProfile":
			user.getProfile(msgPayload, callback);
			break;			
		}
}