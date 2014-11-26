package com.js.project.dto;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;


@Entity(name = "tbl_project")
public class OurProduct {
	private int productId;
	private String productTitle;
	private long productStartDate;
	private long productEndDate;
	private Set<ProductImages> projectImages = new HashSet<ProductImages>();
	private Set<ProductFeatures> projectFeatures = new HashSet<ProductFeatures>();
	private Set<ProductEnvironment> projectEnvironments = new HashSet<ProductEnvironment>();
	

	public OurProduct() {
		super();
	}

	@Id
	@GeneratedValue
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public long getProductStartDate() {
		return productStartDate;
	}

	public void setProductStartDate(long productStartDate) {
		this.productStartDate = productStartDate;
	}

	public long getProductEndDate() {
		return productEndDate;
	}

	public void setProductEndDate(long productEndDate) {
		this.productEndDate = productEndDate;
	}

	@OneToMany(fetch = FetchType.LAZY,cascade={CascadeType.ALL}, targetEntity = ProductFeatures.class)
	@JoinColumn(name="projectId")
	public Set<ProductFeatures> getProjectFeatures() {
		return projectFeatures;
	}

	public void setProjectFeatures(Set<ProductFeatures> projectFeatures) {
		this.projectFeatures = projectFeatures;
	}
	@OneToMany(fetch = FetchType.EAGER,cascade={CascadeType.ALL},targetEntity=ProductImages.class)
	@JoinColumn(name="projectId")
	public Set<ProductImages> getProjectImages() {
		return projectImages;
	}

	public void setProjectImages(Set<ProductImages> projectImages) {
		this.projectImages = projectImages;
	}


	@OneToMany(fetch = FetchType.EAGER,cascade={CascadeType.ALL}, targetEntity = ProductEnvironment.class)
	@JoinColumn(name="projectId")
	public Set<ProductEnvironment> getProjectEnvironments() {
		return projectEnvironments;
	}

	public void setProjectEnvironments(
			Set<ProductEnvironment> projectEnvironments) {
		this.projectEnvironments = projectEnvironments;
	}

}
