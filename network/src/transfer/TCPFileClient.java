package transfer;

import java.io.*;
import java.net.*;

class TCPFileClient {
	public static void main(String argv[]) throws Exception {
		String sentence;
		String modifiedSentence;
		BufferedReader inFromUser = new BufferedReader(new InputStreamReader(
				System.in));
		Socket clientSocket = new Socket("baidu.com", 6789);// hostname is
															// server domainame
		DataOutputStream outToServer = new DataOutputStream(clientSocket
				.getOutputStream());
		BufferedReader inFromServer = new BufferedReader(new InputStreamReader(
				clientSocket.getInputStream()));
		System.out.println("Please Enter File Name:");
		sentence = inFromUser.readLine();
		outToServer.writeBytes(sentence + "\n");
		modifiedSentence = inFromServer.readLine();
		System.out.println("FROM SERVER:" + modifiedSentence);
		clientSocket.close();
	}
}
