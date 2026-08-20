// import ballerina/ai;
// import ballerina/http;

// listener ai:Listener chatAgentListener = new (listenOn = httpListener);

// service /mathTutor on chatAgentListener {
//     resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
//         string stringResult = check mathTutorAgent.run(request.message, request.sessionId);
//         return {message: stringResult};
//     }
// }
