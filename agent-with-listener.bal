import test.integration;
import ballerina/log;
import ballerina/websocket;

listener  websocket:Listener wsListener = check new (9090);

service on new integration:CloudVoiceListener(listenOn = wsListener) {
    isolated remote function onChatMessage(integration:ChatMessage message) returns string|error {
        log:printInfo("Message: ", input = message);
        string response = check mathTutorAgent.run(message.message, message.sessionId);
        log:printInfo("Response: ", output = response);
        return response;
    }
}
