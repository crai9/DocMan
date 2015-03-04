package com.team13.spring.validation;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class Validator {

	public static void main(String[] args) {
		
		String email = "Craig@email.c";
		
		if(checkEmail(email)){
			System.out.println("Valid");
		} else {
			System.out.println("Not Valid");
		}
	}
	
	public static Boolean checkEmail(String email){
		   boolean result = true;
		   try {
		      InternetAddress emailAddr = new InternetAddress(email);
		      emailAddr.validate();
		   } catch (AddressException ex) {
		      result = false;
		   }
		   return result;
	}

}
