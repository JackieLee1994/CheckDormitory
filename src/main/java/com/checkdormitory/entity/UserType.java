package com.checkdormitory.entity;

import javax.persistence.*;

/**
 * Created by lwxzbh on 2017/4/29.
 */
@Entity
@Table(name = "user_type", schema = "CheckDormitory", catalog = "")
public class UserType {
    private int typeId;
    private String type;

    @Id
    @Column(name = "type_id")
    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserType userType = (UserType) o;

        if (typeId != userType.typeId) return false;
        if (type != null ? !type.equals(userType.type) : userType.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = typeId;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }
}
