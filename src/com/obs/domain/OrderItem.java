package com.obs.domain;

import utils.WebUtils;

public class OrderItem {

    private String id;
    private Book book;
    private int quantity;
    private double price;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public OrderItem(CartItem cartItem)
    {
        this.id= WebUtils.makeID();
        this.book=cartItem.getBook();
        this.quantity=cartItem.getQuantity();
        this.price=cartItem.getPrice();
    }
    public OrderItem( )
    {
    }
}
