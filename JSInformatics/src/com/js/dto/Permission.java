package com.js.dto;

import java.io.Serializable;

public final class Permission implements Serializable 
{
	private static final long serialVersionUID = -3329172662149024113L;
	
	private long oid;
	private String permission;
	
	public Permission()
	{
		
	}
	
	public Permission(String permission)
	{
		this.permission = permission;
	}

	public long getOid() 
	{
		return oid;
	}

	public void setOid(long oid) 
	{
		this.oid = oid;
	}

	public String getPermission() 
	{
		return permission;
	}

	public void setPermission(String permission) 
	{
		this.permission = permission;
	}

	@Override
	public boolean equals(Object obj) 
	{
		if(obj instanceof Permission)
		{
			Permission lhs = (Permission)obj;
			String lhsPermission = lhs.permission;
			String rhsPermission = this.permission;
			if(lhsPermission.equals(rhsPermission))
			{
				return true;
			}
		}
		return false;
	}

	@Override
	public int hashCode() 
	{
		return this.permission.hashCode();
	}
	
	public String toString(){
		return "[ OID : "+oid+" , Permission : "+permission+"]";
	}
}
