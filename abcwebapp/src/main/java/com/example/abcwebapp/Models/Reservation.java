package com.example.abcwebapp.Models;

import java.sql.Date;
import java.sql.Timestamp;

public class Reservation {
    private int id;
    private int userId;
    private String serviceType; 
    private Date reservationDate;
    private String customerName;
    private String contactDetails;
    private String specialRequests;
    private String paymentStatus = "Pending";
    private Timestamp createdAt;
    private String status = "Pending";

    public Reservation() {
    }

    // Updated constructor to include paymentStatus
    public Reservation(int id, int userId, String serviceType, Date reservationDate,
                       String customerName, String contactDetails, String specialRequests, String paymentStatus, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.serviceType = serviceType;
        this.reservationDate = reservationDate;
        this.customerName = customerName;
        this.contactDetails = contactDetails;
        this.specialRequests = specialRequests;
        this.paymentStatus = paymentStatus;
        this.createdAt = createdAt;
    }
    
    // Getter and Setter for id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    // Getter and Setter for userId
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Getter and Setter for serviceType
    public String getServiceType() {
        return serviceType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    // Getter and Setter for reservationDate
    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    // Getter and Setter for customerName
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    // Getter and Setter for contactDetails
    public String getContactDetails() {
        return contactDetails;
    }

    public void setContactDetails(String contactDetails) {
        this.contactDetails = contactDetails;
    }

    // Getter and Setter for specialRequests
    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }

    // Getters and Setters for paymentStatus
    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    // Getters and Setters for paymentStatus
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Getter and Setter for createdAt
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Optional: toString method for easy debugging
    @Override
    public String toString() {
        return "Reservation{" +
                "id=" + id +
                ", userId=" + userId +
                ", serviceType='" + serviceType + '\'' +
                ", reservationDate=" + reservationDate +
                ", customerName='" + customerName + '\'' +
                ", contactDetails='" + contactDetails + '\'' +
                ", specialRequests='" + specialRequests + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
