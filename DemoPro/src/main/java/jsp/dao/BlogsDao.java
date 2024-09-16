package jsp.dao;
import java.sql.*;
import jsp.bean.Blogs;
import java.util.ArrayList;
import java.util.List;

public class BlogsDao {
    
    // Method to establish a connection
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Updated driver name for modern MySQL versions
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/list", "root", "root"); // Change credentials as needed
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    // Method to save a new to-do item
    public static int save(Blogs b) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO todo (title, description) VALUES (?, ?)"
            );
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getDescription());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Method to get all records from todo
    public static List<Blogs> getAllRecords() {
        List<Blogs> list = new ArrayList<>();
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM todo");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Blogs b = new Blogs();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setDescription(rs.getString("description"));
                list.add(b);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Method to get a specific record by ID
    public static Blogs getRecordById(int id) {
        Blogs b = null;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM todo WHERE id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                b = new Blogs();
                b.setId(rs.getInt("id"));
                b.setTitle(rs.getString("title"));
                b.setDescription(rs.getString("description"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    
    public static int update(Blogs b) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE todo SET title = ?, description = ? WHERE id = ?"
            );
            ps.setString(1, b.getTitle());
            ps.setString(2, b.getDescription());
            ps.setInt(3, b.getId());
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Method to delete a to-do item
    public static int delete(int id) {
        int status = 0;
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM todo WHERE id = ?"
            );
            ps.setInt(1, id);
            status = ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}

