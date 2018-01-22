package com.obs.service;

import com.obs.domain.*;
import dao.BookDao;
import dao.CategoryDao;
import dao.Impl.UserDaoImpl;
import dao.OrderDao;
import dao.UserDao;
import utils.DaoFactory;
import utils.WebUtils;

import java.util.*;


public class BusinessServiceImpl implements BusinessService {

    private CategoryDao categoryDao = DaoFactory.getInstance().createDao("dao.Impl.CategoryDaoImpl", CategoryDao.class);
    private BookDao bookDao = DaoFactory.getInstance().createDao("dao.Impl.BookDaoImpl", BookDao.class);
    private UserDao userDao = DaoFactory.getInstance().createDao("dao.Impl.UserDaoImpl", UserDao.class);
    private OrderDao orderDao = DaoFactory.getInstance().createDao("dao.Impl.OrderDaoImpl", OrderDao.class);

    public void addCategory(Category category) {
            categoryDao.add(category);
    }


    public Category findCategory(String id) {
        return categoryDao.find(id);
    }


    public List<Category> getAllCategory() {
        return categoryDao.getAll();
    }

    public Book findBook(String id) {
        return bookDao.find(id);

    }
    public Book findBookByName(String bookName) {
        return bookDao.findByName(bookName);

    }

    public Page getBookPageData(String curPage) {
        int totalRecord = bookDao.getTotalRecord();
        int currPage = 1;
        if (curPage != null) {
            currPage = Integer.parseInt(curPage);
        }

        Page page = new Page(currPage, totalRecord);
        List<Book> ls = bookDao.getPageData(page.getStartindex(),
                page.getPagesize());
        page.setList(ls);
        return page;
    }

    public Page getBookPageData(String curPage,String category_id){
        int totalRecord=bookDao.getTotalRecord(category_id);
        int currPage=1;
        if(curPage!=null)
        {
            currPage=Integer.parseInt(curPage);
        }
        Page page=new Page(currPage,totalRecord);

        List<Book> ls = bookDao.getPageData(page.getStartindex(),
                page.getPagesize(),category_id);


        page.setList(ls);

        return page;
    }
    public void addBooktoCart(Cart cart, Book book) {
        cart.add(book);
    }

    public User findUser(String id)
    {
       return userDao.find(id);
    }

    public void registerUser(User user) {
        userDao.add(user);
    }


    public User userLogin(String username, String password){
        return userDao.find(username, password);

    }

    public void createOrder(Cart cart, User user)
    {
        Order order=new Order();
        Map<String,CartItem> map=cart.getMap();
        Set<OrderItem> itemSet=new HashSet<>();
        for(CartItem thisCartItem:map.values())
        {
            itemSet.add(new OrderItem(thisCartItem));
        }
        order.setOrderItems(itemSet);
        order.setId(WebUtils.makeID());
        order.setOrderTime(new Date());
        order.setUser(user);
        order.setPrice(cart.getPrice());
        order.setState(false);
        orderDao.add(order);
    }
    public List<Order> listOrder(String state)
    {
        return orderDao.getAll(Boolean.parseBoolean(state));
    }
    public Order findOrder(String orderId)
    {
        return orderDao.find(orderId);
    }
    public List<Order> listOrder(String userId,String state)
    {
        return orderDao.getAll(Boolean.parseBoolean(state),userId);
    }

    public Map<String,Integer> getAllBook(String id)
    {
        return orderDao.getAllBook(id);
    }
    public List<Order> listOrderForUser(String userId)
    {
        return orderDao.getAllOrder(userId);
    }

}
