package hamrogadi12345.controller.Dao;

import hamrogadi12345.controller.models.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestDriveDAO {
    private Connection connection;

    public TestDriveDAO(Connection connection) {
        this.connection = connection;
    }

    // Insert new test drive
    public boolean insertTestDrive(TestDriveModel testDrive) throws SQLException {
        String query = "INSERT INTO TestDrives (CarID, UserEmail, TestDriveDate, TestDriveTime, TestDriveStatus, TestDriveNotes) "
                     + "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, testDrive.getCarID());
            stmt.setString(2, testDrive.getUserEmail());
            stmt.setDate(3, new java.sql.Date(testDrive.getTestDriveDate().getTime()));
            stmt.setString(4, testDrive.getTestDriveTime());
            stmt.setString(5, testDrive.getTestDriveStatus());
            stmt.setString(6, testDrive.getTestDriveNotes());

            return stmt.executeUpdate() > 0;
        }
    }
    public int getTotalTestDrivesCount() throws SQLException {
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM TestDrives")) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    public int getPendingTestDrivesCount() throws SQLException {
        try (PreparedStatement stmt = connection.prepareStatement(
                "SELECT COUNT(*) FROM TestDrives WHERE TestDriveStatus = 'Pending'")) {
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        }
    }
    
    
    
    
    // Get all test drives ordered by status
    public List<TestDriveModel> getAllTestDrives() throws SQLException {
        List<TestDriveModel> testDrives = new ArrayList<>();
        String query = "SELECT td.*, c.Brand, c.Model, u.Name AS UserName " +
                      "FROM TestDrives td " +
                      "JOIN CarDetails c ON td.CarID = c.CarID " +
                      "JOIN User u ON td.UserEmail = u.Email " +
                      "ORDER BY CASE WHEN td.TestDriveStatus = 'Pending' THEN 1 " +
                                   "WHEN td.TestDriveStatus = 'Approved' THEN 2 " +
                                   "ELSE 3 END, td.TestDriveDate";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                TestDriveModel testDrive = new TestDriveModel();
                testDrive.setTestDriveID(rs.getInt("TestDriveID"));
                testDrive.setCarID(rs.getInt("CarID"));
                testDrive.setUserEmail(rs.getString("UserEmail"));
                testDrive.setTestDriveDate(rs.getDate("TestDriveDate"));
                testDrive.setTestDriveTime(rs.getString("TestDriveTime"));
                testDrive.setTestDriveStatus(rs.getString("TestDriveStatus"));
                testDrive.setTestDriveNotes(rs.getString("TestDriveNotes"));
                
                // Additional fields for display
                testDrive.setCarName(rs.getString("Brand") + " " + rs.getString("Model"));
                testDrive.setUserName(rs.getString("UserName"));
                
                testDrives.add(testDrive);
            }
        }
        return testDrives;
    }

    // Update test drive status
    public boolean updateTestDriveStatus(int testDriveID, String status) throws SQLException {
        String query = "UPDATE TestDrives SET TestDriveStatus = ? WHERE TestDriveID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, status);
            stmt.setInt(2, testDriveID);
            return stmt.executeUpdate() > 0;
        }
    }

    // Delete test drive
    public boolean deleteTestDrive(int testDriveID) throws SQLException {
        String query = "DELETE FROM TestDrives WHERE TestDriveID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, testDriveID);
            return stmt.executeUpdate() > 0;
        }
    }
}