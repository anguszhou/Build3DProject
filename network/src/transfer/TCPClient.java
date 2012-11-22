package transfer;

import java.io.*;
import java.net.*;

class TCPClient {
	public static void Main(String argv[]) throws Exception {
		String sentence;
		String modifiedSentence;
		BufferedReader inFromUser = new BufferedReader(new InputStreamReader(
				System.in));
		Socket clientSocket = new Socket("127.0.0.1", 6789); // hostname is
																// server's
																// domainame
		DataOutputStream outToServer = new DataOutputStream(clientSocket
				.getOutputStream());
		BufferedReader inFromServer = new BufferedReader(new InputStreamReader(
				clientSocket.getInputStream()));
		sentence = inFromUser.readLine();
		System.out.println(sentence);
		outToServer.writeBytes(sentence + "\n");
		modifiedSentence = inFromServer.readLine();
		System.out.println("FROM SERVER:" + modifiedSentence);
		clientSocket.close();
	}
}
