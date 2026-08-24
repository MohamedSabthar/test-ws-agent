import test.integration;
import ballerina/log;
import ballerina/websocket;
import ballerina/http;

listener http:Listener httpListener = check new (9090, httpVersion = "1.1");
listener websocket:Listener wsListener = check new (httpListener);

service on new integration:CloudVoiceListener(listenOn = wsListener) {
    isolated remote function onChatMessage(integration:ChatMessage message) returns string|error {
        log:printInfo("Message: ", input = message);
        string response = check mathTutorAgent.run(message.message, message.sessionId);
        log:printInfo("Response: ", output = response);
        return response;
    }
}
