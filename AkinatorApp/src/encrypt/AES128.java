package encrypt;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
 
public class AES128 {
 /*
  * AES�� ��� 128, 192, 256bit�� Ű ���̸� �����մϴ�
  * key �� �ش��ϴ� ���ڿ��� 16byte(128) �Ǵ� 24byte(192) �Ǵ� 32byte(256) ����
  */
 
    public static String key = "0123456789123456";
    /**
     * hex to byte[] : 16���� ���ڿ��� ����Ʈ �迭�� ��ȯ�Ѵ�.
     *
     * @param hex    hex string
     * @return
     */
 
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() == 0) {
            return null;
        }
 
        byte[] ba = new byte[hex.length() / 2];
        for (int i = 0; i < ba.length; i++) {
            ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
        }
       return ba;
    }
 
    /**
     * byte[] to hex : unsigned byte(����Ʈ) �迭�� 16���� ���ڿ��� �ٲ۴�.
     *
     * @param ba        byte[]
     * @return
     */
 
    public static String byteArrayToHex(byte[] ba) {
        if (ba == null || ba.length == 0) {
            return null;
        }
        StringBuffer sb = new StringBuffer(ba.length * 2);
        String hexNumber;
        for (int x = 0; x < ba.length; x++) {
            hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
            sb.append(hexNumber.substring(hexNumber.length()-2));
        }
        return sb.toString();
    }
 
    /**
     * AES ����� ��ȣȭ
     *
     * @param message
     * @return
     * @throws Exception
     */
 
    public static String encrypt(String message) throws Exception {
 
        // use key coss2
        SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");
        // Instantiate the cipher
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
 
        byte[] encrypted = cipher.doFinal(message.getBytes());
        return byteArrayToHex(encrypted);
    }
 
    /**
     * AES ����� ��ȣȭ
     *
     * @param message
     * @return
     * @throws Exception
     */
 
    public static String decrypt(String encrypted) throws Exception {
        // use key coss2
    	SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes(), "AES");

        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] original = cipher.doFinal(hexToByteArray(encrypted));
        String originalString = new String(original);
        return originalString;
 
    }
 
    public static void main(String[] args)
    {
        try {
            String encrypt = encrypt("test1234");
            System.out.println("origin str = "+"test1234");
            System.out.println("encrypt str = "+encrypt);  
            String decrypt = decrypt(encrypt);
            System.out.println("decrypt str = "+decrypt);        
 
        } catch (Exception e) {
            e.printStackTrace();
        }    
    }
}