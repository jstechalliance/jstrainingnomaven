package com.js.service;

import java.util.List;

import com.js.dto.SuccessStory;

public interface SuccessStoryService {
	
	public String addCandidateInSuccessStory(SuccessStory successStory) throws Exception;
	public String deleteCandidateFromSuccessStory(SuccessStory successStory) throws Exception;
	public List<SuccessStory> gettAllCandidateOfSuccessStory() throws Exception;
	public SuccessStory getCandidateFromSuccessStoryById(long oid) throws Exception;
}
