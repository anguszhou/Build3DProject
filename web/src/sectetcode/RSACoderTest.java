package sectetcode;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import java.util.Map;

public class RSACoderTest {
	private String publicKey;
	private String privateKey;

	@Before
	public void setUp() throws Exception {
		Map<String, Object> keyMap = RSA.initKey();

		publicKey = RSA.getPublicKey(keyMap);
		privateKey = RSA.getPrivateKey(keyMap);
		System.err.println("��Կ: \n\r" + publicKey);
		System.err.println("˽Կ�� \n\r" + privateKey);
	}

	@Test
	public void test() throws Exception {
		System.err.println("��Կ���ܡ���˽Կ����");
		System.out.println();
		System.out.println();
		System.out.println();
		
		String inputStr = "��������72���ܴϣ�ѧ���ǣ�07093048��ʹ��MD5��RSA��DES�㷨��";
		byte[] data = inputStr.getBytes();
		RSA.encryptMD5(data);
		byte[] encodedData = RSA.encryptByPublicKey(data, publicKey);

		byte[] decodedData = RSA.decryptByPrivateKey(encodedData,
				privateKey);

		String outputStr = new String(decodedData);
		System.err.println("����ǰ: " + inputStr + "\n\r" + "���ܺ�: " + outputStr);
		assertEquals(inputStr, outputStr);

	}

	@Test
	public void testSign() throws Exception {
		System.err.println("˽Կ���ܡ�����Կ����");
		String inputStr = "��������72���ܴϣ�ѧ���ǣ�07093048��ʹ��MD5��RSA��DES�㷨��";
		byte[] data = inputStr.getBytes();

		byte[] encodedData = RSA.encryptByPrivateKey(data, privateKey);
		System.out.println("˽Կ���ܽ����"+new String(encodedData));
		

		byte[] decodedData = RSA
				.decryptByPublicKey(encodedData, publicKey);

		String outputStr = new String(decodedData);
		System.err.println("����ǰ: " + inputStr + "\n\r" + "���ܺ�: " + outputStr);
		assertEquals(inputStr, outputStr);

		System.err.println("˽Կǩ��������Կ��֤ǩ��");
		// ����ǩ��
		String sign = RSA.sign(encodedData, privateKey);
		System.err.println("ǩ��:\r" + sign);

		// ��֤ǩ��
		boolean status = RSA.verify(encodedData, publicKey, sign);
		System.err.println("״̬:\r" + status);
		assertTrue(status);

	}

}
