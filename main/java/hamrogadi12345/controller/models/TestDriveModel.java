package hamrogadi12345.controller.models;

import java.util.Date;

public class TestDriveModel {
    private int testDriveID;
    private int carID;
    private String userEmail;
    private Date testDriveDate;
    private String testDriveTime;
    private String testDriveStatus;
    private String testDriveNotes;
    
    // Additional fields for display
    private String carName;
    private String userName;

    // Getters and Setters for all fields
    public int getTestDriveID() {
        return testDriveID;
    }

    public void setTestDriveID(int testDriveID) {
        this.testDriveID = testDriveID;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public Date getTestDriveDate() {
        return testDriveDate;
    }

    public void setTestDriveDate(Date testDriveDate) {
        this.testDriveDate = testDriveDate;
    }

    public String getTestDriveTime() {
        return testDriveTime;
    }

    public void setTestDriveTime(String testDriveTime) {
        this.testDriveTime = testDriveTime;
    }

    public String getTestDriveStatus() {
        return testDriveStatus;
    }

    public void setTestDriveStatus(String testDriveStatus) {
        this.testDriveStatus = testDriveStatus;
    }

    public String getTestDriveNotes() {
        return testDriveNotes;
    }

    public void setTestDriveNotes(String testDriveNotes) {
        this.testDriveNotes = testDriveNotes;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}