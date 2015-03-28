package com.team13.spring.model;

import java.util.List;

public class NotificationSet {

	private int count;
	private List<Notification> notifications;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public List<Notification> getNotifications() {
		return notifications;
	}
	public void setNotifications(List<Notification> notifications) {
		this.notifications = notifications;
	}

}
