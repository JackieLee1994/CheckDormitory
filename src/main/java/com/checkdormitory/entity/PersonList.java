package com.checkdormitory.entity;

import java.util.List;

/**
 * Created by lwxzbh on 2017/5/3.
 */
public class PersonList {
    private List<Person> person;

    public List<Person> getUser(){
        return person;
    }
    public void setUser(List<Person> person){
        this.person=person;
    }
}
