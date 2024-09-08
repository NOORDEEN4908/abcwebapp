package com.example.abcwebapp.Models;

import java.util.Date;

public class Query {
    private int id;
    private int userId;
    private String name;
    private String email;
    private String query;
    private Date submissionDate;
    private String answer;

    // Default constructor
    public Query() {
    }

    // Parameterized constructor
    public Query(int id, int userId, String name, String email, String query, Date submissionDate, String answer) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.query = query;
        this.submissionDate = submissionDate;
        this.answer = answer;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Query{" +
                "id=" + id +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", query='" + query + '\'' +
                ", submissionDate=" + submissionDate +
                ", answer='" + answer + '\'' +
                '}';
    }
}
