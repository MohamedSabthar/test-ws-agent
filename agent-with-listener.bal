import ballerinax/ai.wso2.integration;

service on new integration:CloudVoiceListener(8004) {
    isolated remote function onChatMessage(integration:ChatMessage message) returns string|error {
        return mathTutorAgent.run(message.message, message.sessionId);
    }
}
