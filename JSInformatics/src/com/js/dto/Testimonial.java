package com.js.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity(name="tbl_testimonial")
public class Testimonial {
	
	private Long oid;
	private String candidateName;
	private String college;
	private String photoPath;
	private MultipartFile file;
	private String content;
	private Long createdDate;
	private String status;
	private SuccessStory successStory;
	
	@Id
	@GeneratedValue
	public Long getOid() {
		return oid;
	}
	public void setOid(Long oid) {
		this.oid = oid;
	}
	public String getCandidateName() {
		return candidateName;
	}
	public void setCandidateName(String candidateName) {
		this.candidateName = candidateName;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	@Transient
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Long createdDate) {
		this.createdDate = createdDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@OneToOne(mappedBy="testimonial", cascade=CascadeType.ALL)
	public SuccessStory getSuccessStory() {
		return successStory;
	}
	public void setSuccessStory(SuccessStory successStory) {
		this.successStory = successStory;
	}
	@Override
	public String toString() {
		return "Testimonial [oid=" + oid + ", candidateName=" + candidateName
				+ ", college=" + college + ", photoPath=" + photoPath
				+ ", file=" + file + ", content=" + content + ", createdDate="
				+ createdDate + ", status=" + status + ", successStory="
				+ successStory + "]";
	}
	
	
	
}
