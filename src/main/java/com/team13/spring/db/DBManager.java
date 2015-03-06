package com.team13.spring.db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//import com.team13.spring.login.Encrypt;
import com.team13.spring.model.User;

public class DBManager {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/documentmanager";
    
    //  Database credentials
    static final String USER = "java";
    static final String PASS = "java";
    
	private static Connection getDBConnection() {
		 
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
		
		int id = 1;
		
		String[] roles = getUserRolesById(id);
		
		for(String role : roles){
			System.out.println(role);
		}
		
	}
	
	public static String[] getUserRolesById(int id){
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT users.userId, user_roles.`ROLE` "
				+ "FROM users "
				+ "INNER JOIN user_roles "
				+ "ON users.userId=user_roles.userId "
				+ "WHERE users.userId = ?";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setInt(1, id);
			
			ResultSet rs = preparedStatement.executeQuery();
			
            List<String> all = new ArrayList<String>();
            while(rs.next()){
            	all.add(rs.getString("ROLE"));
            }

           String[] array = (String[]) all.toArray(new String[all.size()]);
           
           return array;
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null;
	}
	
	public static void createUser(String username, String password, String fname, String lname, String email){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
 
		String sql = "INSERT INTO users"
				+ "(userId, username, password, firstName, lastName, email, enabled) VALUES"
				+ "(NULL,?,?,?,?,?,1)";
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, fname);
			preparedStatement.setString(4, lname);
			preparedStatement.setString(5, email);
 			
			preparedStatement.executeUpdate();
 
			System.out.println("Record is inserted into users table");
 
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} 
		
	}
	
	public static void updateUser(int id, String username, String fname, String lname, String email){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
 
		String sql = "UPDATE users SET "
				+ "username = ?, firstName = ?, lastName = ?, email = ? "
				+ "WHERE userId = ?";
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, fname);
			preparedStatement.setString(3, lname);
			preparedStatement.setString(4, email);
			preparedStatement.setInt(5, id);
			
			
 			
			preparedStatement.executeUpdate();
 
			System.out.println(preparedStatement.toString());
			
			System.out.println("Record is updated in users table");
 
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} 
		
	}
	
	public static void deleteUserById(int id){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "DELETE FROM users WHERE userId = ?";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setInt(1, id);

			preparedStatement.executeUpdate();
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		
	}
	
	public static User getUserById(int id){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT * FROM users WHERE userId = ?";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setInt(1, id);

			ResultSet rs = preparedStatement.executeQuery();
			
			User u = new User();
			
			if(rs.next()){
	        	u.setId(rs.getInt("userId"));
	        	u.setUsername(rs.getString("username"));
	        	u.setEmail(rs.getString("email"));
	        	u.setFirstName(rs.getString("firstName"));
	        	u.setLastName(rs.getString("lastName"));
			}
			
			return u;
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null;
	}
	
	public static Boolean checkIfUserExists(String username){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT * FROM users WHERE username = ?";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setString(1, username);

			preparedStatement.executeQuery();
			
            ResultSet rs = preparedStatement.executeQuery();
            
            if (!rs.isBeforeFirst() ) {    
            	 return false;
            	} else {
            		return true;
            	}
 
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null; 
		
	}
	
	public static String[] allUsersToArray(){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT username FROM users";
		
		try {
			dbConnection = getDBConnection();
			
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.executeQuery();
			
            ResultSet rs = preparedStatement.executeQuery();
            
            List<String> all = new ArrayList<String>();
            while(rs.next()){
            	all.add(rs.getString("username"));
            }

           String[] array = (String[]) all.toArray(new String[all.size()]);
           
           return array;
           
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null; 
		
	}
	
	public static List<User> allUsers(String search){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
		
		String sql = null;
		
		if(search == null){
			sql = "SELECT * FROM users";
		} else {
			sql = "SELECT * FROM users WHERE username LIKE ?";
		}
		
			
	
		try {
			dbConnection = getDBConnection();
			
			preparedStatement = dbConnection.prepareStatement(sql);
			
			if(search != null){
				
				preparedStatement.setString(1, "%" + search + "%");
			
			}
			
			preparedStatement.executeQuery();
			
			System.out.println(preparedStatement.toString());
			
            ResultSet rs = preparedStatement.executeQuery();
            
            List<User> all = new ArrayList<User>();
            while(rs.next()){
            	User u = new User();
            	
            	u.setId(rs.getInt("userId"));
            	u.setUsername(rs.getString("username"));
            	u.setEmail(rs.getString("email"));
            	u.setFirstName(rs.getString("firstName"));
            	u.setLastName(rs.getString("lastName"));
            	
            	all.add(u);
            }

           return all;
           
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null; 
		
	}
	
	public static int login(String username, String password) throws SQLException {
		 
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
                String last = rs.getString("lastName");
                
                System.out.print("First Name: " + name);
                System.out.print(", Last Name: " + last);
                System.out.print("\n");
                
                return rs.getInt("userId");

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
		return 0;
 
	}
	
	
	
}
