package com.js.db;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import com.js.exception.JSIException;

public class MyConnection {
//	static{
//		try{
//    		Class.forName("com.mysql.jdbc.Driver"); 		
//    	}catch(Exception ex){
//    		new JSIException(ex).log();
//    		ex.printStackTrace();
//    	}
//	}
//	public Connection getConnection() throws Exception{
//		Properties prop=new Properties();
//		InputStream in = getClass().getResourceAsStream("database.properties");
//        prop.load(in);    
//
//        String connectionURL = prop.getProperty("jdbc.url");
//        String username = prop.getProperty("jdbc.username");
//        String password = prop.getProperty("jdbc.password");
//        in.close();
//		Connection con=DriverManager.getConnection(connectionURL,username,password);
//		return con;
//	}
}
