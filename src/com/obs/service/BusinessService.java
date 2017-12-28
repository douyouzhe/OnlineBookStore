package com.obs.service;

import com.obs.domain.*;

import java.util.List;

public interface BusinessService {


    void addCategory(Category category);
    Category findCategory(String id);
    List<Category> getAllCategory();

    Book findBook(String id);
    Book findBookByName(String bookName);
    Page getBookPageData(String curPage);
    Page getBookPageData(String curPage,String category_id);
    void addBooktoCart(Cart cart, Book book);

    User findUser(String id);
    void registerUser(User user);
    User userLogin(String username, String password);

    void createOrder(Cart cart, User user);
    List<Order> listOrder(String state);
    Order findOrder(String orderId);
    List<Order> listOrder(String userId,String state);

    public List<Order> listOrderForUser(String userId);


}