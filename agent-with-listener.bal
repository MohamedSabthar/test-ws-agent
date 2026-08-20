import test.integration;
import ballerina/log;

service on new integration:CloudVoiceListener(8004) {
    isolated remote function onChatMessage(integration:ChatMessage message) returns string|error {
        log:printInfo("Message: ", input = message);
        string response = check mathTutorAgent.run(message.message, message.sessionId);
        log:printInfo("Response: ", output = response);
        return response;
    }
}
