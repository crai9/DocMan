package com.team13.spring.db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBManager {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/documentmanager";
    
    //  Database credentials
    static final String USER = "root";
    static final String PASS = "root";
    
	public static Connection getDBConnection() {
		 
		Connection dbConnection = null;
 
		try {
 
			Class.forName(JDBC_DRIVER);
 
		} catch (ClassNotFoundException e) {
 
			System.out.println(e.getMessage());
 
		}
 
		try {
 
			dbConnection = DriverManager.getConnection(
                            DB_URL, USER,PASS);
			return dbConnection;
 
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
 
		return dbConnection;
 
	}
	
	public static void main(String[] args){
		
		//main method for testing only
		
		String username = "craig";
		String password = "test";
		
		try {
			login(username, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void login(String username, String password) throws SQLException {
		 
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT * FROM users WHERE username = ? AND password = ? LIMIT 1";
		
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);

			preparedStatement.executeQuery();
			
            ResultSet rs = preparedStatement.executeQuery();
            
            while(rs.next()){
 
                String name = rs.getString("firstName");
                String country = rs.getString("lastName");
                
                System.out.print("First Name: " + name);
                System.out.print(", Last Name: " + country);
                System.out.print("\n");

            }
 
 
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} finally {
 
			if (preparedStatement != null) {
				preparedStatement.close();
			}
 
			if (dbConnection != null) {
				dbConnection.close();
			}
 
		}
 
	}
	
	
	
}
