package com.js.service;

import java.util.Set;
import com.js.dto.Permission;
import com.js.exception.JSIException;

public interface PermissionService {

	public Set<Permission> getAllPermissionOfAnyUser(String uid) throws JSIException;
	
}
