package com.js.project.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name = "tbl_project_environment")
public class ProductEnvironment {
	private int envId;
	private String envName;
	

	public ProductEnvironment() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Id
	@GeneratedValue
	public int getEnvId() {
		return envId;
	}

	public void setEnvId(int envId) {
		this.envId = envId;
	}

	public String getEnvName() {
		return envName;
	}

	public void setEnvName(String envName) {
		this.envName = envName;
	}

	
}
