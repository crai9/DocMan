package com.team13.spring.db;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.team13.spring.model.Document;
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
		
		System.out.println(countDocuments());
		System.out.println(countDocuments("cool"));
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
	
	public static void createUser(String username, String password, String fname, String lname, String email, String adminRole){
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
			
			PreparedStatement getLastInsertId = dbConnection.prepareStatement("SELECT LAST_INSERT_ID()");
			ResultSet rs = getLastInsertId.executeQuery();
			long userId;
			if (rs.next())
			{
			 userId = rs.getLong("last_insert_id()");   
			 System.out.println("Last userId inserted: " + userId);
			 addRole(userId, "ROLE_USER");
				if(adminRole.equals("yes")){
					System.out.println("This user should be an admin.");
					addRole(userId, "ROLE_ADMIN");
				} else {
					System.out.println("This user shouldn't be an admin.");
				}

			}
			
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} 
		
	}
	
	public static void addRole(long userId, String ROLE){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
 
		String sql = "INSERT INTO user_roles"
				+ "(user_role_id, userId, ROLE) VALUES"
				+ "(NULL, ?, ?)";
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setLong(1, userId);
			preparedStatement.setString(2, ROLE);
			
			preparedStatement.executeUpdate();
 
			System.out.println("Role Added");

			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} 
		
	}
	
	public static void addDistributee(int userId, int revisionId){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		String sql = "INSERT INTO distributees"
				+ "(distributeeId, userId, documentId, distributionDate) VALUES"
				+ "(NULL, ?, ?, ?)";
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, revisionId);
			preparedStatement.setString(3, date);
			
			preparedStatement.executeUpdate();
 
			System.out.println("Distributee Added");

			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		} 
		
	}
	
	public static void removeRole(long userId, String ROLE){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
 
		String sql = "DELETE FROM user_roles "
				+ "WHERE userId = ? AND ROLE = ?";
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setLong(1, userId);
			preparedStatement.setString(2, ROLE);
			
			preparedStatement.executeUpdate();
 
			System.out.println("Role Removed");

			
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
	
	public static void deleteDocumentById(int id){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "DELETE FROM document_records WHERE documentId = ?";
		
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
			} else {
				//don't return null
				u.setId(0);
	        	u.setUsername("");
	        	u.setEmail("");
	        	u.setFirstName("");
	        	u.setLastName("");
			}
			
			return u;
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null;
	}
	
	public static int getUserIdByUsername(String username){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT * FROM users WHERE username = ? LIMIT 1";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();
			
			int id = 0;
			
			if(rs.next()){
	        	id = rs.getInt("userId");
			}
			
			return id;
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return 0;
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
	
	public static int countUsers(String s){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT count(userId) AS total FROM users WHERE username LIKE ?";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);

			preparedStatement.setString(1, s);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			
			
			if(rs.next()){
				int count = rs.getInt("total");
				return count;
			} 
			

			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return 0;
	}
	
	public static int countUsers(){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT count(userId) AS total FROM users";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);

			ResultSet rs = preparedStatement.executeQuery();
			
			
			
			if(rs.next()){
				int count = rs.getInt("total");
				return count;
			} 
			

			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return 0;
	}
	
	public static List<User> allUsersPaged(String search, double perPage, int start){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
		
		String sql = null;
		
		if(search == null){
			sql = "SELECT * FROM users ORDER BY userId LIMIT ? OFFSET ?";
		} else {
			sql = "SELECT * FROM users WHERE username LIKE ? ORDER BY userId LIMIT ? OFFSET ?";
		}
		
			
	
		try {
			dbConnection = getDBConnection();
			
			preparedStatement = dbConnection.prepareStatement(sql);
			if(search != null){
				
				preparedStatement.setString(1, "%" + search + "%");
				preparedStatement.setInt(2, (int)perPage);
				preparedStatement.setInt(3, start);
			
			} else {
				
				preparedStatement.setInt(1, (int)perPage);
				preparedStatement.setInt(2, start);
				
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
	
	public static long createDocument(String title, String description, 
			String authorName){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		long documentId = 0;
 
		String sql = "INSERT INTO document_records "
				+ "(documentId, title, description, author) "
				+ "VALUES (NULL, ?, ?, ?)";
		
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setString(1, title);
			preparedStatement.setString(2, description);
			preparedStatement.setString(3, authorName);

			
			System.out.println(preparedStatement.toString());
			preparedStatement.executeUpdate();
 
			System.out.println("Record is inserted");
			
			PreparedStatement getLastInsertId = dbConnection.prepareStatement("SELECT LAST_INSERT_ID()");
			ResultSet rs = getLastInsertId.executeQuery();
			if (rs.next())
			{
			 documentId = rs.getLong("last_insert_id()");   
			 System.out.println("Last userId inserted: " + documentId);
			}
			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return documentId; 
		
	}
	
	public static void addRevision(int revisionNo, String fileName,  long documentId,
			String dateCreated, String status){
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		String sql = "INSERT INTO revisions "
				+ "(revisionId, revisionNo, documentAttachment, documentId, createdDate, status) "
				+ "VALUES (NULL, ?, ?, ?, ?, ?)";
		
 
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
 
			preparedStatement.setInt(1, revisionNo);
			preparedStatement.setString(2, fileName);
			preparedStatement.setLong(3, documentId);
			preparedStatement.setString(4, dateCreated);
			preparedStatement.setString(5, status);
			System.out.println(preparedStatement.toString());
			preparedStatement.executeUpdate();
 
			System.out.println("Revision is inserted");

		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		
	}
	
	
	public static int countDocuments(String search){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT count(DISTINCT documentId) as total "
				+ "FROM document_records "
				+ "WHERE documentId LIKE ? OR title LIKE ? OR description LIKE ? OR author LIKE ?";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
			
			search = "%" + search + "%";
			
			preparedStatement.setString(1, search);
			preparedStatement.setString(2, search);
			preparedStatement.setString(3, search);
			preparedStatement.setString(4, search);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			
			
			if(rs.next()){
				int count = rs.getInt("total");
				return count;
			} 
			

			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return 0;
	}
	
	public static int countDocuments(){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
 
		String sql = "SELECT count(DISTINCT documentId) as total FROM document_records;";
		
		try {
			dbConnection = getDBConnection();
			preparedStatement = dbConnection.prepareStatement(sql);
			ResultSet rs = preparedStatement.executeQuery();
			
			
			
			if(rs.next()){
				int count = rs.getInt("total");
				return count;
			} 
			

			
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return 0;
	}
	
	public static List<Document> allDocumentsPaged(String search, double perPage, int start){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
		
		String sql = null;
		
		if(search == null){
			sql = "SELECT document_records.documentId, document_records.title, document_records.author, revisions.createdDate, revisions.status "
					+ "FROM document_records "
					+ "INNER JOIN "
					+ "(SELECT `documentId`, `createdDate`, `status` FROM `revisions` ORDER BY `revisionNo` DESC) revisions "
					+ "ON document_records.documentId = revisions.documentId "
					+ "GROUP BY document_records.documentId "
					+ "LIMIT ? OFFSET ?";
			
		} else {
			sql = "SELECT document_records.documentId, document_records.title, document_records.author, revisions.createdDate, revisions.status "
					+ "FROM document_records "
					+ "INNER JOIN "
					+ "(SELECT `documentId`, `createdDate`, `status` FROM `revisions` ORDER BY `revisionNo` DESC) revisions "
					+ "ON document_records.documentId = revisions.documentId "
					+ "WHERE title LIKE ? OR document_records.documentId LIKE ? OR author LIKE ? OR description LIKE ? "
					+ "GROUP BY document_records.documentId "
					+ "LIMIT ? OFFSET ?";
		}
		
			
	
		try {
			dbConnection = getDBConnection();
			
			preparedStatement = dbConnection.prepareStatement(sql);
			if(search != null){
				search = "%" + search + "%";
				preparedStatement.setString(1, search);
				preparedStatement.setString(2, search);
				preparedStatement.setString(3, search);
				preparedStatement.setString(4, search);
				preparedStatement.setInt(5, (int)perPage);
				preparedStatement.setInt(6, start);
			
			} else {
				
				preparedStatement.setInt(1, (int)perPage);
				preparedStatement.setInt(2, start);
				
			}
			System.out.println(preparedStatement);
			preparedStatement.executeQuery();
			
			System.out.println(preparedStatement.toString());
			
            ResultSet rs = preparedStatement.executeQuery();
            
            List<Document> all = new ArrayList<Document>();
            while(rs.next()){

            	Document u = new Document();
            	
            	u.setId(rs.getInt("documentId"));
            	
            	u.setTitle(rs.getString("title"));
            	u.setAuthor(rs.getString("author"));
            	u.setCreatedDate(rs.getString("createdDate"));
            	u.setStatus(rs.getString("status"));
            	
            	System.out.println(u.getTitle());
            	System.out.println(u.getId());
            	all.add(u);
            }

           return all;
           
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null; 
		
	}

	public static List<Document> allDocuments(String search){
		
		Connection dbConnection = null;
		
		PreparedStatement preparedStatement = null;
		
		String sql = null;

		sql = "SELECT document_records.documentId, document_records.title, document_records.author, revisions.createdDate, revisions.status "
				+ "FROM document_records "
				+ "INNER JOIN "
				+ "(SELECT `documentId`, `createdDate`, `status` FROM `revisions` ORDER BY `revisionNo` DESC) revisions "
				+ "ON document_records.documentId = revisions.documentId "
				+ "GROUP BY document_records.documentId";
	
		try {
			dbConnection = getDBConnection();
			
			preparedStatement = dbConnection.prepareStatement(sql);
			System.out.println(preparedStatement.toString());
			preparedStatement.executeQuery();
			
			System.out.println(preparedStatement.toString());
			
            ResultSet rs = preparedStatement.executeQuery();
            
            List<Document> all = new ArrayList<Document>();
            while(rs.next()){
            	Document u = new Document();
            	
            	u.setId(rs.getInt("documentId"));
            	u.setTitle(rs.getString("title"));
            	u.setAuthor(rs.getString("author"));
            	u.setCreatedDate(rs.getString("createdDate"));
            	u.setStatus(rs.getString("status"));
            	
            	all.add(u);
            }

           return all;
           
		} catch (SQLException e) {
 
			System.out.println(e.getMessage());
 
		}
		return null; 
		
	}

public static Document getDocumentById(int id){
	
	Connection dbConnection = null;
	
	PreparedStatement preparedStatement = null;
	

	String sql = "SELECT document_records.documentId, document_records.title, document_records.description, document_records.author, revisions.revisionId, revisions.revisionNo, revisions.documentAttachment, revisions.createdDate, revisions.status "
			+ "FROM document_records "
			+ "INNER JOIN revisions "
			+ "ON document_records.documentId = revisions.documentId "
			+ "WHERE document_records.documentId = ?";

	try {
		dbConnection = getDBConnection();
		
		preparedStatement = dbConnection.prepareStatement(sql);
		
		preparedStatement.setInt(1, id);
		
		preparedStatement.executeQuery();
		
		System.out.println(preparedStatement.toString());
		
        ResultSet rs = preparedStatement.executeQuery();
        
        Document d = new Document();
        
        while(rs.next()){
        	
        	
        	d.setId(rs.getInt("documentId"));
        	d.setTitle(rs.getString("title"));
        	d.setDescription(rs.getString("description"));
        	d.setAuthor(rs.getString("author"));
        	d.setRevisionNo(rs.getInt("revisionNo"));
        	d.setDocumentAttached(rs.getString("documentAttachment"));
        	d.setCreatedDate(rs.getString("createdDate"));
        	d.setStatus(rs.getString("status"));
        	
        }

       return d;
       
	} catch (SQLException e) {

		System.out.println(e.getMessage());

	}
	return null;
}
public static int password(String password) throws SQLException {
	 
	Connection dbConnection = null;
	
	PreparedStatement preparedStatement = null;

	String sql = "SELECT * FROM users WHERE password = ? LIMIT 1";
	

	try {
		dbConnection = getDBConnection();
		preparedStatement = dbConnection.prepareStatement(sql);

		preparedStatement.setString(1, password);

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
