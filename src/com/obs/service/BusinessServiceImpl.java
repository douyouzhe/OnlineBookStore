package com.obs.service;

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

    //private CategoryDao categoryDao = DaoFactory.getInstance().createDao("dao.impl.CategoryDaoImpl", CategoryDao.class);
    //private BookDao bookDao = DaoFactory.getInstance().createDao("dao.impl.BookDaoImpl", BookDao.class);
    //private UserDao userDao = DaoFactory.getInstance().createDao("dao.impl.UserDaoImpl", UserDao.class);
    //private OrderDao orderDao = DaoFactory.getInstance().createDao("dao.impl.OrderDaoImpl", OrderDao.class);
    private UserDao userDao= new UserDaoImpl();


    @Override
    public void addCategory(Category category) {

    }

    @Override
    public Category findCategory(String id) {
        return null;
    }

    @Override
    public List<Category> getAllCategory() {
        return null;
    }

    public void registerUser(User user) {
        userDao.add(user);
    }


    public User userLogin(String username, String password){
        return userDao.find(username, password);

    }

}
