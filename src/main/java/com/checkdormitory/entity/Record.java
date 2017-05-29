package com.checkdormitory.entity;

/**
 * Created by lwxzbh on 2017/5/24.
 */
public class Record {
    private StudentInfo studentInfo;
    private CheckResult checkResult;
    private Long count;
    public Record(CheckResult checkResult, StudentInfo studentInfo) {
        this.checkResult = checkResult;
        this.studentInfo = studentInfo;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Long getCount() {
        return count;
    }

    public void setStudentInfo(StudentInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public void setCheckResult(CheckResult checkResult) {
        this.checkResult = checkResult;
    }

    public StudentInfo getStudentInfo() {
        return studentInfo;
    }

    public CheckResult getCheckResult() {
        return checkResult;
    }
}
