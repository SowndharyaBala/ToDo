package jsp.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jsp.bean.User;

public class UserDao {

    // Method to establish a database connection
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_register", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    // Method to save a new user
    public static int save(User u){  
        int status = 0;
        try {  
            Connection con = getConnection();  
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO details(username, password) VALUES(?, ?)"
            );  
            ps.setString(1, u.getUsername());  
            ps.setString(2, u.getPassword());  
            status = ps.executeUpdate();  
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }  
        return status;  
    }

    

    // Method to update user details
    public static int update(User u) {
        int status = 0;
        try (Connection con = getConnection()) {
            String query = "UPDATE details SET username = ?, password = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setInt(3, u.getId());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Method to delete a user
    public static int delete(int id) {
        int status = 0;
        try (Connection con = getConnection()) {
            String query = "DELETE FROM details WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Method to fetch all users
    public static List<User> getAllRecords() {
        List<User> list = new ArrayList<>();
        try (Connection con = getConnection()) {
            String query = "SELECT * FROM details";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to fetch a user by ID
    public static User getRecordById(int id) {
        User u = null;
        try (Connection con = getConnection()) {
            String query = "SELECT * FROM details WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }
}
