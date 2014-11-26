package com.js.project.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name = "tbl_project_images")
public class ProductImages {
	private int imageId;
	private String imagePath;
	
	
	public ProductImages() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
    @GeneratedValue
	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	
}
