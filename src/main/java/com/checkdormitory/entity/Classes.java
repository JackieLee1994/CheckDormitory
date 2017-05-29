package com.checkdormitory.entity;

import javax.persistence.*;

/**
 * Created by lwxzbh on 2017/5/25.
 */
@Entity
@Table(name = "classes", schema = "CheckDormitory")
public class Classes {
    private long id;
    private int collegeId;
    private int grade;
    private String className;
    private int distributed;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "college_id")
    public int getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(int collegeId) {
        this.collegeId = collegeId;
    }

    @Basic
    @Column(name = "grade")
    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    @Basic
    @Column(name = "class_name")
    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Basic
    @Column(name = "distributed")
    public int getDistributed() {
        return distributed;
    }

    public void setDistributed(int distributed) {
        this.distributed = distributed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Classes classes = (Classes) o;

        if (id != classes.id) return false;
        if (collegeId != classes.collegeId) return false;
        if (grade != classes.grade) return false;
        if (distributed != classes.distributed) return false;
        if (className != null ? !className.equals(classes.className) : classes.className != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + collegeId;
        result = 31 * result + grade;
        result = 31 * result + (className != null ? className.hashCode() : 0);
        result = 31 * result + distributed;
        return result;
    }
}
