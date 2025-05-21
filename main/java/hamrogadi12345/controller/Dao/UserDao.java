package hamrogadi12345.controller.Dao;

import hamrogadi12345.controller.models.UserModel;
import hamrogadi12345.controller.util.PasswordUtil;

import java.sql.Statement;

import hamrogadi12345.controller.models.CarModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDao {

	  public int registerUser(UserModel userModel) {
	        try (Connection con = DBConnections.getConnection()) {
	            // Check if email already exists
	            if (checkEmailIfExists(userModel.getEmail())) {
	                return -2; // Email already exists
	            }

	            String role = userModel.getRole();
	            // If role is "admin", store as "pending"
	            if ("admin".equalsIgnoreCase(role)) {
	                role = "pending"; // Store as 'pending' for admin
	            }

	            // Generate salt and hash password
	            String salt = PasswordUtil.generateSalt();
	            String hashedPassword = PasswordUtil.hashPassword(userModel.getPassword(), salt);

	            PreparedStatement stmt = con.prepareStatement(
	                "INSERT INTO User (Name, Email, Password, Salt, PhoneNumber, Role, Address) VALUES (?, ?, ?, ?, ?, ?, ?)"
	            );
	            stmt.setString(1, userModel.getName());
	            stmt.setString(2, userModel.getEmail());
	            stmt.setString(3, hashedPassword);
	            stmt.setString(4, salt);
	            stmt.setString(5, userModel.getPhoneNumber());
	            stmt.setString(6, role);
	            stmt.setString(7, userModel.getAddress());

	            int result = stmt.executeUpdate();
	            return (result > 0) ? 1 : 0;
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	            return -1; // Internal error
	        }
	    }

	  
	  public int getUserCountByRole(String role) throws SQLException, ClassNotFoundException {
		    try (Connection con = DBConnections.getConnection();
		         PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM User WHERE Role = ?")) {
		        stmt.setString(1, role);
		        try (ResultSet rs = stmt.executeQuery()) {
		            return rs.next() ? rs.getInt(1) : 0;
		        }
		    }
		}

		public int getTotalUsersCount() throws SQLException, ClassNotFoundException {
		    try (Connection con = DBConnections.getConnection();
		         Statement stmt = con.createStatement();
		         ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM User")) {
		        return rs.next() ? rs.getInt(1) : 0;
		    }
		}
	    // Login a user
	    public int loginUser(String email, String password) {
	        try (Connection con = DBConnections.getConnection()) {
	            PreparedStatement stmt = con.prepareStatement(
	                "SELECT Password, Salt FROM User WHERE Email = ?"
	            );
	            stmt.setString(1, email);
	            ResultSet result = stmt.executeQuery();

	            if (result.next()) {
	                String storedHash = result.getString("Password");
	                String storedSalt = result.getString("Salt");
	                
	                // Verify the password
	                boolean passwordMatch = PasswordUtil.verifyPassword(password, storedHash, storedSalt);
	                return passwordMatch ? 1 : 0;
	            } else {
	                return -1; // Email not found
	            }
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	            return -2; // Internal error
	        }
	    }
    
    public static List<UserModel> getAllUsers() throws SQLException, ClassNotFoundException {
        List<UserModel> userList = new ArrayList<>();
        try (Connection con = DBConnections.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM User");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setRole(rs.getString("Role"));
                user.setAddress(rs.getString("Address"));
                userList.add(user);
            }
        }
        return userList;
    }

    public static UserModel getUserByEmail(String email) throws SQLException, ClassNotFoundException {
        try (Connection con = DBConnections.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(
                "SELECT * FROM User WHERE Email = ?"
            );
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                UserModel user = new UserModel();
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPassword(rs.getString("Password"));
                user.setSalt(rs.getString("Salt"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setRole(rs.getString("Role"));
                user.setAddress(rs.getString("Address"));
                return user;
            }
            return null;
        }
    }

    public static boolean updateUser(UserModel user) throws SQLException, ClassNotFoundException {
        try (Connection con = DBConnections.getConnection()) {
            if (user.getSalt() != null && !user.getSalt().isEmpty()) {
                // Update with password change
                PreparedStatement stmt = con.prepareStatement(
                    "UPDATE User SET Name=?, Password=?, Salt=?, PhoneNumber=?, Address=? WHERE Email=?"
                );
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getPassword());
                stmt.setString(3, user.getSalt());
                stmt.setString(4, user.getPhoneNumber());
                stmt.setString(5, user.getAddress());
                stmt.setString(6, user.getEmail());
                return stmt.executeUpdate() > 0;
            } else {
                // Update without password change
                PreparedStatement stmt = con.prepareStatement(
                    "UPDATE User SET Name=?, PhoneNumber=?, Address=? WHERE Email=?"
                );
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getPhoneNumber());
                stmt.setString(3, user.getAddress());
                stmt.setString(4, user.getEmail());
                return stmt.executeUpdate() > 0;
            }
        }
    }

    public static boolean deleteUserByEmail(String email) throws SQLException, ClassNotFoundException {
        try (Connection con = DBConnections.getConnection()) {
            con.setAutoCommit(false); // Start transaction

            try {
                // 1. Delete from testdrives table where user is referenced
                PreparedStatement deleteTestDrives = con.prepareStatement("DELETE FROM testdrives WHERE UserEmail = ?");
                deleteTestDrives.setString(1, email);
                deleteTestDrives.executeUpdate();

                // 2. Delete from User table
                PreparedStatement deleteUser = con.prepareStatement("DELETE FROM User WHERE Email = ?");
                deleteUser.setString(1, email);
                int affectedRows = deleteUser.executeUpdate();

                con.commit(); // Commit transaction
                return affectedRows > 0;
            } catch (SQLException e) {
                con.rollback(); // Rollback in case of error
                e.printStackTrace();
                return false;
            }
        }
    }
    public String getUserRole(String email) throws SQLException, ClassNotFoundException {
        try (Connection con = DBConnections.getConnection()) {
            PreparedStatement stmt = con.prepareStatement("SELECT Role FROM User WHERE Email = ?");
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("Role");
            }
        }
        return null; // return null if role not found
    }
    
    
    
    
    
    // Check if email already exists
    private boolean checkEmailIfExists(String email) {
        try (Connection con = DBConnections.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(
                "SELECT Email FROM User WHERE Email = ?"
            );
            stmt.setString(1, email);
            ResultSet result = stmt.executeQuery();
            return result.next();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}