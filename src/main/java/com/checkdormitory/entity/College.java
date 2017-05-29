package com.checkdormitory.entity;

import javax.persistence.*;

/**
 * Created by lwxzbh on 2017/5/25.
 */
@Entity
@Table(name = "college", schema = "CheckDormitory")
public class College {
    private int id;
    private String collegeName;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "college_name")
    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        College college = (College) o;

        if (id != college.id) return false;
        if (collegeName != null ? !collegeName.equals(college.collegeName) : college.collegeName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (collegeName != null ? collegeName.hashCode() : 0);
        return result;
    }
}
