package com.obs.service;

import com.obs.domain.User;

import java.util.List;

public class BusinessServiceImpl implements BusinessService {

    private CategoryDao categoryDao = DaoFactory.getInstance().createDao("dao.impl.CategoryDaoImpl", CategoryDao.class);
    private BookDao bookDao = DaoFactory.getInstance().createDao("dao.impl.BookDaoImpl", BookDao.class);
    private UserDao userDao = DaoFactory.getInstance().createDao("dao.impl.UserDaoImpl", UserDao.class);
    private OrderDao orderDao = DaoFactory.getInstance().createDao("dao.impl.OrderDaoImpl", OrderDao.class);


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
}
