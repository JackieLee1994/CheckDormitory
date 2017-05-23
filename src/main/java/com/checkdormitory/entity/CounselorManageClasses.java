package com.checkdormitory.entity;

import javax.persistence.*;

/**
 * Created by lwxzbh on 2017/5/23.
 */
@Entity
@Table(name = "counselor_manage_classes", schema = "CheckDormitory", catalog = "")
public class CounselorManageClasses {
    private long id;
    private String classes;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "classes")
    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CounselorManageClasses that = (CounselorManageClasses) o;

        if (id != that.id) return false;
        if (classes != null ? !classes.equals(that.classes) : that.classes != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (classes != null ? classes.hashCode() : 0);
        return result;
    }
}
