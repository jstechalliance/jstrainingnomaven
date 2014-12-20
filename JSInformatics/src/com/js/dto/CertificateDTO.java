package com.js.dto;

/**
 * A simple Data Transfer Object to contain our sales item
 *
 */
public class CertificateDTO {

	private String registrationNo;
	private String firstParagraph;
	private String secondParagraph;
	private String courseName;
	private String thirdParagraph;
	private String fourthParagraph;
	private String authorizedSignatory;
	private String issueDate;
	private String gender;
	
	
	
	public String getRegistrationNo() {
		return registrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}
	public String getFirstParagraph() {
		return firstParagraph;
	}
	public void setFirstParagraph(String firstParagraph) {
		this.firstParagraph = firstParagraph;
	}
	public String getSecondParagraph() {
		return secondParagraph;
	}
	public void setSecondParagraph(String secondParagraph) {
		this.secondParagraph = secondParagraph;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getThirdParagraph() {
		return thirdParagraph;
	}
	public void setThirdParagraph(String thirdParagraph) {
		this.thirdParagraph = thirdParagraph;
	}
	public String getFourthParagraph() {
		return fourthParagraph;
	}
	public void setFourthParagraph(String fourthParagraph) {
		this.fourthParagraph = fourthParagraph;
	}
	public String getAuthorizedSignatory() {
		return authorizedSignatory;
	}
	public void setAuthorizedSignatory(String authorizedSignatory) {
		this.authorizedSignatory = authorizedSignatory;
	}
	public String getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
}
