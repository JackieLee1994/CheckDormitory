package com.checkdormitory.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by lwxzbh on 2017/5/13.
 */
@Entity
@Table(name = "check_result", schema = "CheckDormitory", catalog = "")
public class CheckResult {
    private long id;
    private Integer studentNumber;
    private String date;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "student_number")
    public Integer getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(Integer studentNumber) {
        this.studentNumber = studentNumber;
    }

    @Basic
    @Column(name = "date")
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CheckResult that = (CheckResult) o;

        if (id != that.id) return false;
        if (studentNumber != that.studentNumber) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + studentNumber;
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
