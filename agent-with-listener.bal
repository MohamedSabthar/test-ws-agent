import test.integration;

import ballerina/http;
import ballerina/log;
import ballerina/websocket;

listener websocket:Listener wsListener = check new ('listener = check http:getDefaultListener());

service on new integration:CloudVoiceListener(listenOn = wsListener) {
    isolated remote function onChatMessage(integration:ChatMessage message) returns string|error {
        log:printInfo("Message: ", input = message);
        string response = check mathTutorAgent.run(message.message, message.sessionId);
        log:printInfo("Response: ", output = response);
        return response;
    }
}
