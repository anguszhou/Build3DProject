package sectetcode;

import static org.junit.Assert.*;


import org.junit.Test;

/**
 * 
 * @author ����
 * @version 1.0
 * @since 1.0
 */
public class DESCoderTest {

	@Test
	public void test() throws Exception {
		String inputStr = "�������72���ܴϣ�ѧ���ǣ�07093048��ʹ��MD5��RSA��DES�㷨��";
		String key = DESCoder.initKey();
		System.err.println("ԭ��:\t" + inputStr);

		System.err.println("��Կ:\t" + key);

		byte[] inputData = inputStr.getBytes();
		inputData = DESCoder.encrypt(inputData, key);

		System.err.println("���ܺ�:\t" + DESCoder.encryptBASE64(inputData));

		byte[] outputData = DESCoder.decrypt(inputData, key);
		String outputStr = new String(outputData);

		System.err.println("���ܺ�:\t" + outputStr);

		assertEquals(inputStr, outputStr);
	}
}
