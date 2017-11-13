package com.obs.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> map = new HashMap<>();
    private double price;

    public void add(Book book){
        CartItem item = map.get(book.getId());
        if(item ==null){
            item = new CartItem();
            item.setBook(book);
            item.setQuantity(1);
            map.put(book.getId(), item);
        }else{
            item.setQuantity(item.getQuantity() + 1);
        }
    }

    public Map<Integer, CartItem> getMap() {
        return map;
    }
    public void setMap(Map<Integer, CartItem> map) {
        this.map = map;
    }
    public double getPrice() {

        double totalprice = 0;
        for(Map.Entry<Integer, CartItem> me : map.entrySet()){
            CartItem item = me.getValue();
            totalprice = totalprice + item.getPrice();
        }
        this.price = totalprice;
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
}