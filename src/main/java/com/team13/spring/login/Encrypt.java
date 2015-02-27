package com.team13.spring.login;

//import java.security.InvalidKeyException;
//import javax.crypto.BadPaddingException;
//import javax.crypto.Cipher;
//import javax.crypto.IllegalBlockSizeException;
//import javax.crypto.KeyGenerator;
//import javax.crypto.NoSuchPaddingException;
//import javax.crypto.SecretKey;

import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
 
public class Encrypt {    
	
	private static MessageDigest digester;
	
	public static void main(String[] args){
		//testing it
		
		String s = "Craig's Pass";
		
		
		String enc = crypt(s);
		
		System.out.println("Original: " + s + ", Crypt: " + enc);
	}
	
    static {
        try {
            digester = MessageDigest.getInstance("MD5");
        }
        catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public static String crypt(String str) {
        if (str == null || str.length() == 0) {
            throw new IllegalArgumentException("String to encript cannot be null or zero length");
        }

        digester.update(str.getBytes());
        byte[] hash = digester.digest();
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < hash.length; i++) {
            if ((0xff & hash[i]) < 0x10) {
                hexString.append("0" + Integer.toHexString((0xFF & hash[i])));
            }
            else {
                hexString.append(Integer.toHexString(0xFF & hash[i]));
            }
        }
        return hexString.toString();
    }
	
/*	public static String encryptString(String string) {
 
		try{
 
		    KeyGenerator keygenerator = KeyGenerator.getInstance("DES");
		    SecretKey myDesKey = keygenerator.generateKey();
 s
		    Cipher desCipher;
 
		    desCipher = Cipher.getInstance("DES/ECB/PKCS5Padding");
 
		    desCipher.init(Cipher.ENCRYPT_MODE, myDesKey);
 
		    byte[] text = string.getBytes();
 
		    byte[] textEncrypted = desCipher.doFinal(text);
		    
		    String EncString = textEncrypted.toString();
		    
		    return EncString;
 
 
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}catch(NoSuchPaddingException e){
			e.printStackTrace();
		}catch(InvalidKeyException e){
			e.printStackTrace();
		}catch(IllegalBlockSizeException e){
			e.printStackTrace();
		}catch(BadPaddingException e){
			e.printStackTrace();
		} 
		return "";
	}*/
}