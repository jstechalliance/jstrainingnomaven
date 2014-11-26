package com.js.dao;

import java.util.Set;
import com.js.dto.Permission;
import com.js.exception.JSIException;

public interface PermissionDAO {

	public Set<Permission> getAllPermissionOfAnyUser(String uid) throws JSIException;
	
}
