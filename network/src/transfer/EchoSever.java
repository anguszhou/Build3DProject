package transfer;

import java.net.*;
import java.io.*;

class EchoServer {
	int i;

	public static void main(String args[]) {
		ServerSocket serverSocket = null;
		try {
			serverSocket = new ServerSocket(4000, 10);
		} catch (IOException e) {
			System.out.println("Could not listen on port:" + 4000 + "," + e);
			System.exit(1);
		}
		Socket clientSocket = null;
		try {
			System.out.println("before accept\n");
			clientSocket = serverSocket.accept();
			System.out.println("after accept\n");
		} catch (IOException e) {
			System.out.println("Accept failed:" + 4000 + "," + e);
			System.exit(1);
		}
		try {
			DataInputStream is = new DataInputStream(new BufferedInputStream(
					clientSocket.getInputStream()));
			PrintStream os = new PrintStream(new BufferedOutputStream(
					clientSocket.getOutputStream(), 1024), false);
			String inputLine, outputLine;
			while ((inputLine = is.readLine()) != null) {
				for (int i = 0; i < inputLine.length(); i++)
					os.write((byte) Character.toUpperCase(inputLine.charAt(i)));
				os.write((byte) '\n');
				System.out.println(inputLine);
				os.flush();
			}
			os.close();
			is.close();
			clientSocket.close();
			serverSocket.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
