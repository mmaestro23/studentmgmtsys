package com.sms.model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
public class Student implements Serializable {

    @Id
    private String regNo;
    private String fistName;
    private String lastName;
    private Date dob;

    public Student() {
    }

    public Student(String regNo, String fistName, String lastName, Date dob) {
        this.regNo = regNo;
        this.fistName = fistName;
        this.lastName = lastName;
        this.dob = dob;
    }

    public String getRegNo() {
        return regNo;
    }

    public void setRegNo(String regNo) {
        this.regNo = regNo;
    }

    public String getFistName() {
        return fistName;
    }

    public void setFistName(String fistName) {
        this.fistName = fistName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Date getDob() {
        return dob;
    }

    public String getDateOfBirth() {
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        if (this.dob != null) {
            return formatter.format(this.dob);
        }
        return "";
    }
    public void setDob(Date dob) {
        this.dob = dob;
    }

}
