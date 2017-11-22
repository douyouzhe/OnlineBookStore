package com.obs.service;

import com.obs.domain.Book;
import com.obs.domain.Page;
import com.obs.domain.User;
import com.obs.domain.Category;
import dao.BookDao;
import dao.CategoryDao;
import dao.Impl.UserDaoImpl;
import dao.OrderDao;
import dao.UserDao;
import utils.DaoFactory;

import java.util.List;


public class BusinessServiceImpl implements BusinessService {

    private CategoryDao categoryDao = DaoFactory.getInstance().createDao("dao.impl.CategoryDaoImpl", CategoryDao.class);
    private BookDao bookDao = DaoFactory.getInstance().createDao("dao.impl.BookDaoImpl", BookDao.class);
    private UserDao userDao = DaoFactory.getInstance().createDao("dao.impl.UserDaoImpl", UserDao.class);
    private OrderDao orderDao = DaoFactory.getInstance().createDao("dao.impl.OrderDaoImpl", OrderDao.class);



    @Override
    public void addCategory(Category category) {
            categoryDao.add(category);
    }

    @Override
    public Category findCategory(String id) {
        return categoryDao.find(id);
    }

    @Override
    public List<Category> getAllCategory() {
        return categoryDao.getAll();
    }

    public Book findBook(String id) {
        return bookDao.find(id);

    }

    public Page getBookPageData(String curPage){
        if(curPage==null)
        {
           int totalRecord=bookDao.getTotalRecord();
           Page page=new Page(1,totalRecord);
        }
    return page;

    }








    public void registerUser(User user) {
        userDao.add(user);
    }


    public User userLogin(String username, String password){
        return userDao.find(username, password);

    }

}
