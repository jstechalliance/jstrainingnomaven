package com.js.service.impl;

import java.util.Set;
import com.js.dao.PermissionDAO;
import com.js.dto.Permission;
import com.js.exception.JSIException;
import com.js.service.PermissionService;

public class PermissionServiceImpl implements PermissionService{
	
	private PermissionDAO permissionDAO;
	
	public PermissionDAO getPermissionDAO() {
		return permissionDAO;
	}

	public void setPermissionDAO(PermissionDAO permissionDAO) {
		this.permissionDAO = permissionDAO;
	}

	public Set<Permission> getAllPermissionOfAnyUser(String uid) throws JSIException{
		return permissionDAO.getAllPermissionOfAnyUser(uid);
	}
	
}
