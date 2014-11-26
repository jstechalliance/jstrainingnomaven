package com.js.project.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity(name = "tbl_project_feature")
public class ProductFeatures {
	private int featureId;
	private String featureName;
	

	public ProductFeatures() {
		super();		
	}

	@Id
	@GeneratedValue
	public int getFeatureId() {
		return featureId;
	}

	public void setFeatureId(int featureId) {
		this.featureId = featureId;
	}

	public String getFeatureName() {
		return featureName;
	}

	public void setFeatureName(String featureName) {
		this.featureName = featureName;
	}
}
