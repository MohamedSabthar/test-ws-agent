import test.integration;
import ballerina/io;

service on new integration:CloudVoiceListener(8004) {
    isolated remote function onChatMessage(integration:ChatMessage message) returns string|error {
        io:println(message);
        return mathTutorAgent.run(message.message, message.sessionId);
    }
}
