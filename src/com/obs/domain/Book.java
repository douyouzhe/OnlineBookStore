package com.obs.domain;

public class Book {

/*
 * create table book
   (
        id varchar(40) primary key,
        name varchar(100) not null unique,
        author varchar(100) not null,
        price double not null,
        image varchar(100),
        description varchar(255),
        category_id varchar(40),
        constraint category_id_FK foreign key(category_id) references category(id)
   );
 */

    private int id;
    private String name;
    private String author;
    private double price;
    private String image;
    private String description;
    private int category_id;

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

}