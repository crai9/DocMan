package com.team13.spring.login;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
 
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
 
public class Encrypt
{    
	
	public static String encryptString(String string) {
 
		try{
 
		    KeyGenerator keygenerator = KeyGenerator.getInstance("DES");
		    SecretKey myDesKey = keygenerator.generateKey();
 
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
	}
}