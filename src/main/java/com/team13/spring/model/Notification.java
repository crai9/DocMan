package com.team13.spring.model;

public class Notification {

	private int notificationId;
	private int documentId;
	private String documentTitle;
	private int fromId;
	private String from; 
	
	public int getNotificationId() {
		return notificationId;
	}
	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getDocumentTitle() {
		return documentTitle;
	}
	public void setDocumentTitle(String documentTitle) {
		this.documentTitle = documentTitle;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public int getFromId() {
		return fromId;
	}
	public void setFromId(int fromId) {
		this.fromId = fromId;
	}
	
	
}
