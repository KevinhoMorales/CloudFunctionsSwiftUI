import * as functions from "firebase-functions";

interface MyData {
  name?: string;
}

export const helloWorld = functions.https.onCall(
  (request: functions.https.CallableRequest) => {
    const input = request.data as MyData;
    const name = input.name ?? "Mundo";
    return {message: `Hola ${name} desde Firebase! 🚀`};
  }
);
