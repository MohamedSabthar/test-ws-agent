import ballerinax/ai.openai;

final openai:ModelProvider wso2ModelProvider = check new (accessToken, openai:GPT_4O_MINI);
