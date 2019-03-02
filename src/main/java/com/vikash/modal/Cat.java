package com.vikash.modal;

import javax.persistence.*;


@Entity
@Table(name="cat")
public class Cat {
	
	@Id
	public int Cid;
	private String category;
	
	
	
	public Cat() {
		
	}
	
	
	public Cat(String category) {
		super();
		this.Cid=Cid;
		this.category = category;
	}


	


	public int getCid() {
		return Cid;
	}


	public void setCid(int Cid) {
		this.Cid = Cid;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	@Override
	public String toString() {
		return "Cat [Cid=" + Cid + ", category=" + category + "]";
	}

	
}

