package com.obs.domain;


public class Category {
	/*
	 create table category
	 (
		id varchar(40) primary key,
		name varchar(100) not null unique,
		description varchar(255)
	 );
	 */

    private int id;
    private String name;
    private String description;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }



}
