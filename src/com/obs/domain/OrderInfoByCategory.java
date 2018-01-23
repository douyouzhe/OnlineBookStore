package com.obs.domain;

public class OrderInfoByCategory {
    private String user_id;
    private int category_id;
    private int amount;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "OrderInfoByCategory{" +
                "user_id='" + user_id + '\'' +
                ", category_id=" + category_id +
                ", amount=" + amount +
                '}';
    }
}


