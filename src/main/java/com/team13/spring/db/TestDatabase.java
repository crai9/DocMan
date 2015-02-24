package com.team13.spring.db;

import java.sql.*;

public class TestDatabase {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/documentmanager";
    
    //  Database credentials
    static final String USER = "java";
    static final String PASS = "java";
    
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement stmt = null;
        try{

            Class.forName("com.mysql.jdbc.Driver");
            
            System.out.println("Connecting to database...\n");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            

            System.out.println("Creating statement...\n");
            String sql = "SELECT * FROM person WHERE name = ?";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, "Craig");
            
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
 
                int id  = rs.getInt("id");
                String name = rs.getString("name");
                String country = rs.getString("country");
                
                System.out.print("ID: " + id);
                System.out.print(", Name: " + name);
                System.out.print(", Country: " + country);
                System.out.print("\n");

            }
            
            	rs.close();
            	stmt.close();
            	conn.close();
            }catch(SQLException se){

            se.printStackTrace();
            }catch(Exception e){

            e.printStackTrace();
            }finally{

            try{
                if(stmt!=null)
                stmt.close();
                }catch(SQLException se2){
            }
            try{
                if(conn!=null)
                conn.close();
                }catch(SQLException se){
                se.printStackTrace();
            }
        }//end try
        System.out.println("\nEnd");
    }
}