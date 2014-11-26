package com.js.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbcp.BasicDataSource;

import com.js.dao.PermissionDAO;
import com.js.dto.Permission;
import com.js.exception.JSIException;

public class PermissionDAOImpl implements PermissionDAO{

	private BasicDataSource basicDataSource;

	public BasicDataSource getBasicDataSource() {
		return basicDataSource;
	}

	public void setBasicDataSource(BasicDataSource basicDataSource) {
		this.basicDataSource = basicDataSource;
	}

	public Set<Permission> getAllPermissionOfAnyUser(String uid) throws JSIException{
		Set <Permission>permissionList = new HashSet<Permission>();
		Connection con = null;
		try{
			
			con = basicDataSource.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from tbl_pages_user_permission where uid = ?");
			ps.setString(1,uid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String pageName=rs.getString("pageName");
				Permission permission = new Permission();
				permission.setPermission(pageName);
				permissionList.add(permission);
			}
			rs.close();
			ps.close();
		}
		catch(Exception ex){
			throw new JSIException(ex);
		}
		finally{
			try{
				if(con!=null){
					con.close();
				}
			}catch(Exception ex){}
		}
		return permissionList;
	}
	
}
