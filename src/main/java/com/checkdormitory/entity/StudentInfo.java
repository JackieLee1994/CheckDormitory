package com.checkdormitory.entity;

import javax.persistence.*;

/**
 * Created by lwxzbh on 2017/4/20.
 */
@Entity
@Table(name = "student_info", schema = "CheckDormitory")
public class StudentInfo {
    private int stuNumber;
    private String name;
    private String headImg;
    private String tel;
    private String college;
    private String major;
    private String clazz;
    private String dormitoryBuilding;
    private String dormitoryNumber;
    private short bedNumber;
    private Integer noComingSum;

    @Id
    @Column(name = "stu_number")
    public int getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(int stuNumber) {
        this.stuNumber = stuNumber;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "head_img")
    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

    @Basic
    @Column(name = "tel")
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Basic
    @Column(name = "college")
    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    @Basic
    @Column(name = "major")
    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Basic
    @Column(name = "class")
    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    @Basic
    @Column(name = "dormitory_building")
    public String getDormitoryBuilding() {
        return dormitoryBuilding;
    }

    public void setDormitoryBuilding(String dormitoryBuilding) {
        this.dormitoryBuilding = dormitoryBuilding;
    }

    @Basic
    @Column(name = "dormitory_number")
    public String getDormitoryNumber() {
        return dormitoryNumber;
    }

    public void setDormitoryNumber(String dormitoryNumber) {
        this.dormitoryNumber = dormitoryNumber;
    }

    @Basic
    @Column(name = "bed_number")
    public short getBedNumber() {
        return bedNumber;
    }

    public void setBedNumber(short bedNumber) {
        this.bedNumber = bedNumber;
    }

    @Basic
    @Column(name = "no_coming_sum")
    public Integer getNoComingSum() {
        return noComingSum;
    }

    public void setNoComingSum(Integer noComingSum) {
        this.noComingSum = noComingSum;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        StudentInfo that = (StudentInfo) o;

        if (stuNumber != that.stuNumber) return false;
        if (bedNumber != that.bedNumber) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (headImg != null ? !headImg.equals(that.headImg) : that.headImg != null) return false;
        if (tel != null ? !tel.equals(that.tel) : that.tel != null) return false;
        if (college != null ? !college.equals(that.college) : that.college != null) return false;
        if (major != null ? !major.equals(that.major) : that.major != null) return false;
        if (clazz != null ? !clazz.equals(that.clazz) : that.clazz != null) return false;
        if (dormitoryBuilding != null ? !dormitoryBuilding.equals(that.dormitoryBuilding) : that.dormitoryBuilding != null)
            return false;
        if (dormitoryNumber != null ? !dormitoryNumber.equals(that.dormitoryNumber) : that.dormitoryNumber != null)
            return false;
        if (noComingSum != null ? !noComingSum.equals(that.noComingSum) : that.noComingSum != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = stuNumber;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (headImg != null ? headImg.hashCode() : 0);
        result = 31 * result + (tel != null ? tel.hashCode() : 0);
        result = 31 * result + (college != null ? college.hashCode() : 0);
        result = 31 * result + (major != null ? major.hashCode() : 0);
        result = 31 * result + (clazz != null ? clazz.hashCode() : 0);
        result = 31 * result + (dormitoryBuilding != null ? dormitoryBuilding.hashCode() : 0);
        result = 31 * result + (dormitoryNumber != null ? dormitoryNumber.hashCode() : 0);
        result = 31 * result + (int) bedNumber;
        result = 31 * result + (noComingSum != null ? noComingSum.hashCode() : 0);
        return result;
    }
}
