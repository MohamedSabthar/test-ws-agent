import ballerina/log;
import ballerina/websocket;

service on new websocket:Listener(9090) {
    resource function get .() returns websocket:Service|websocket:Error {
        return new WsService();
    }
}

type Message record {|
    string message;
    string sessionId;
|};

service class WsService {
    *websocket:Service;

    remote function onMessage(websocket:Caller caller, Message message) returns string|error {
        log:printInfo("Message: ", input = message);
        string response = check mathTutorAgent.run(message.message, message.sessionId);
        log:printInfo("Response: ", output = response);
        return response;
    }
}
