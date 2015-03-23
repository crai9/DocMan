package com.team13.spring.model;

public class Document {

	private int id;
	private String title;
	private String description;
	private String author;
	
	private String revisionNo;
	private String documentAttached;
	private String createdDate;
	private String status;
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getDescription(){
		return description;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public String getAuthor(){
		return author;
	}
	
	public void setAuthor(String author){
		this.author = author;
	}
	
	public String getRevisionNo(){
		return revisionNo;
	}
	
	public void setRevisionNo(String revisionNo){
		this.revisionNo = revisionNo;
	}
	
	public String getDocumentAttached(){
		return documentAttached;
	}
	
	public void setDocumentAttached(String documentAttached){
		this.documentAttached = documentAttached;
	}
	
	public String getCreatedDate(){
		return createdDate;
	}
	
	public void setCreatedDate(String createdDate){
		this.createdDate = createdDate;
	}
	
	public String getStatus(){
		return status;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
}
