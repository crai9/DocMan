package com.team13.spring.email;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.sendgrid.*;

public class Sender {
	private static SendGrid instance = null;
	private final static String pass = "verysecretpassword";
	private final static String username = "ip3docman";
	private static String date = new SimpleDateFormat("h:mma, EEE d MMM").format(new Date());

	private static String accountHtml = "<!DOCTYPE html><html style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"> <head> <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/> <meta name=\"viewport\" content=\"width=device-width\"/> </head> <body style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; width: 100%% !important; height: 100%%; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; background: #efefef; margin: 0; padding: 0;\" bgcolor=\"#efefef\"><table class=\"body-wrap\" style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; width: 100%% !important; height: 100%%; -webkit-font-smoothing: antialiased; -webkit-text-size-adjust: none; background: #efefef; margin: 0; padding: 0;\" bgcolor=\"#efefef\"><tr style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"><td class=\"container\" style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; display: block !important; clear: both !important; max-width: 580px !important; margin: 0 auto; padding: 0;\"> <table style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; width: 100%% !important; border-collapse: collapse; margin: 0; padding: 0;\"><tr style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"><td align=\"center\" class=\"masthead\" style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; color: white; background: #D81111; margin: 0; padding: 80px 0;\" bgcolor=\"#D81111\"> <h1 style=\"font-size: 32px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.25; max-width: 90%%; text-transform: uppercase; margin: 0 auto; padding: 0;\">DocMan</h1> </td></tr><tr style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"><td class=\"content\" style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; background: white; margin: 0; padding: 30px 35px;\" bgcolor=\"white\"> <h2 style=\"font-size: 28px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.25; margin: 0 0 20px; padding: 0;\">Hey %s,</h2> <p style=\"font-size: 16px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; font-weight: normal; margin: 0 0 20px; padding: 0;\">An account was created for you at DocMan at %s! You can now log in and start sharing documents.</p><p style=\"font-size: 16px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; font-weight: normal; margin: 0 0 20px; padding: 0;\">Your username is: <b style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\">%s</b><br style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"/>And your password is: <b style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\">%s</b></p><p style=\"font-size: 16px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; font-weight: normal; margin: 0 0 20px; padding: 0;\">Remember to change your password after you log in!</p><table style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; width: 100%% !important; border-collapse: collapse; margin: 0; padding: 0;\"><tr style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"><td align=\"center\" style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\"> <p style=\"font-size: 16px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; font-weight: normal; margin: 0 0 20px; padding: 0;\"> <a href=\"http://46.101.43.121/\" class=\"button\" style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; color: white; text-decoration: none; display: inline-block; font-weight: bold; border-radius: 4px; background: #D81111; margin: 0; padding: 0; border-color: #d81111; border-style: solid; border-width: 10px 20px 8px;\">Sign in Now</a> </p></td></tr></table><p style=\"font-size: 16px; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; font-weight: normal; margin: 0 0 20px; padding: 0;\"><em style=\"font-size: 100%%; font-family: 'Avenir Next', 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif; line-height: 1.65; margin: 0; padding: 0;\">– Your company's administrator</em></p></td></tr></table></td></tr></table></body></html>";
	
	private static SendGrid getSendGridInstance(){
		if(instance == null){
			instance = new SendGrid(username, pass);
		}
		return instance;
	}
	
	public static void main(String[] args){
		
		
	}
	
	public static void newAccount(String username, String password, String to, String first){
		
	    SendGrid.Email email = new SendGrid.Email();
	    email.addTo(to);
	    email.setFrom("no-reply@docman.com");
	    email.setFromName("DocMan");
	    email.setSubject("Your DocMan Account");
	    email.setText("test");
	    email.setHtml(String.format(accountHtml, first, date, username, password));

	    try {
	      SendGrid.Response response = getSendGridInstance().send(email);
	      System.out.println(response.getMessage());
	    }
	    catch (SendGridException e) {
	      System.err.println(e);
	    }
	    
	}
	
	public static void newDocument(){
		
	}
	
}
