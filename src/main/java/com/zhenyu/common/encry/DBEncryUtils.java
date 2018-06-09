package com.zhenyu.common.encry;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class DBEncryUtils {
	private static final String encodeRules = "zhenyu";
	private static SecretKey original_key;
	static{
		
        KeyGenerator keygen;
		try {
			keygen = KeyGenerator.getInstance("DES");
			keygen.init(new SecureRandom(encodeRules.getBytes()));        
	        original_key=keygen.generateKey();
	        keygen = null;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}     
	}
	public static String AESEncode(String content){
        try {                                        
            byte [] byte_encode=content.getBytes("utf-8");
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.ENCRYPT_MODE, original_key);           
            byte [] byte_AES=cipher.doFinal(byte_encode);      
            String AES_encode=new String(new BASE64Encoder().encode(byte_AES));
            return AES_encode;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        
        //如果有错就返加nulll
        return null;         
    }
   
    public static String AESDncode(String content){
        try {
        	 byte [] byte_content= new BASE64Decoder().decodeBuffer(content);         
        	 Cipher cipher = Cipher.getInstance("DES");          
        	 cipher.init(Cipher.DECRYPT_MODE, original_key);   
            byte [] byte_decode=cipher.doFinal(byte_content);
            String AES_decode=new String(byte_decode,"utf-8");
            return AES_decode;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        }
        
        //如果有错就返加nulll
        return null;         
    }
    public static void main(String[] args) {
		System.out.println(AESEncode("136505"));
		/*URL urlOfClass = DBEncryUtils.class.getClassLoader().getResource("org/slf4j/spi/LocationAwareLogger.class");
		System.out.println(urlOfClass);;*/
	}

}
