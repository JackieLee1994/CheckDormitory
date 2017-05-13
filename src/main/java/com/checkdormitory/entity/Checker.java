package com.checkdormitory.entity;

import javax.persistence.*;

/**
 * Created by lwxzbh on 2017/5/12.
 */
@Entity
@Table(name = "checker", schema = "CheckDormitory")
public class Checker {
    private long id;
    private String checkScope;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "check_scope")
    public String getCheckScope() {
        return checkScope;
    }

    public void setCheckScope(String checkScope) {
        this.checkScope = checkScope;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Checker checker = (Checker) o;

        if (id != checker.id) return false;
        if (checkScope != null ? !checkScope.equals(checker.checkScope) : checker.checkScope != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (checkScope != null ? checkScope.hashCode() : 0);
        return result;
    }
}
