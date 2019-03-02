package com.vikash.modal;

import java.util.Arrays;


import javax.persistence.*;

@Entity
@Table(name="book")
public class Book {
	
	@Id
	private int id;
	private String bookname;
	private String author;
	private int category;
	public boolean publishstatus;
	//@Lob
	//private byte[] file;
	private String file;
	public boolean langexpert;
	public boolean admin;
	public boolean editor;
	

	public Book() {
		
	}
	
	
	public Book(String bookname, String author,int category,boolean publishstatus,String file, boolean langexpert,boolean editor,boolean admin) {
		super();
		this.bookname = bookname;
		this.author = author;
		this.category=category;
		this.publishstatus=publishstatus;
		this.file = file;
		this.langexpert=langexpert;
		this.editor=editor;
		this.admin=admin;
		
	}


	public boolean isLangexpert() {
		return langexpert;
	}


	public void setLangexpert(boolean langexpert) {
		this.langexpert = langexpert;
	}


	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(boolean admin) {
		this.admin = admin;
	}


	public boolean isEditor() {
		return editor;
	}


	public void setEditor(boolean editor) {
		this.editor = editor;
	}


	public int getid() {
		return id;
	}


	public void setid(int id) {
		this.id = id;
	}


	public String getBookname() {
		return bookname;
	}


	public void setBookname(String bookname) {
		this.bookname = bookname;
	}


	public String getAuthor() {
		return author;
	}


	public void setAuthor(String author) {
		this.author = author;
	}


	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public boolean isPublishstatus() {
		return publishstatus;
	}


	public void setPublishstatus(boolean publishstatus) {
		this.publishstatus = publishstatus;
	}


	public String getFile() {
		return file;
	}


	public void setFile(String file) {
		this.file = file;
	}


	@Override
	public String toString() {
		return "Book [id=" + id + ", bookname=" + bookname + ", author=" + author + ", category=" + category
				+ ", publishstatus=" + publishstatus + ", file=" + file + ", langexpert=" + langexpert
				+ ", admin=" + admin + ", editor=" + editor + "]";
	}


	
	
	
}


	
	
	
	
	
