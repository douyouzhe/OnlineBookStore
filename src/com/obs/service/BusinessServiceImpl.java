package com.obs.service;

import com.obs.domain.*;
import dao.*;
import dao.Impl.UserDaoImpl;
import utils.DaoFactory;
import utils.WebUtils;

import java.util.*;


public class BusinessServiceImpl implements BusinessService {

    private CategoryDao categoryDao = DaoFactory.getInstance().createDao("dao.Impl.CategoryDaoImpl", CategoryDao.class);
    private BookDao bookDao = DaoFactory.getInstance().createDao("dao.Impl.BookDaoImpl", BookDao.class);
    private UserDao userDao = DaoFactory.getInstance().createDao("dao.Impl.UserDaoImpl", UserDao.class);
    private OrderDao orderDao = DaoFactory.getInstance().createDao("dao.Impl.OrderDaoImpl", OrderDao.class);
    private ReviewDao reviewDao = DaoFactory.getInstance().createDao("dao.Impl.ReviewDaoImpl", ReviewDao.class);

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
            Book bk = new Book();
            bk = thisCartItem.getBook();
            int storage = bk.getStorage();
            int sales = bk.getSales();


            storage -= thisCartItem.getQuantity();
            sales += thisCartItem.getQuantity();


            bookDao.updateRecord(bk.getId(),storage,sales);

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

    /*
	takes two inputs:
	user: userId and OrderInfoByCategory
	ls: list of the rest users and their OrderInfoByCategory
 	return userId of the mostSimilarUser (String)
 */
    public String mostSimilarUser(List<OrderInfoByCategory> ls,String userId){

        // max is actually min euclidean distance,
        // so trying to find the min value
        int maxMatchScore = Integer.MAX_VALUE;
        String mostSimilarUser = null;

        int[] orderAmount= new int[10];
        int[] orderAmountUser= new int[10];
        orderAmountUser = getInfoMatrix(ls,userId);

        List<User> userList=userDao.findAllUsers();
        for(User oibc: userList){
            if(!oibc.getId().equals(userId))
            {
                int euclideanDistance = 0;
                orderAmount = getInfoMatrix(ls, oibc.getId());

                for (int i = 0; i < 10; i++) {
                    int tmp = (orderAmount[i] - orderAmountUser[i]) * (orderAmount[i] - orderAmountUser[i]);
                    euclideanDistance += tmp;
                }
                //System.out.println(euclideanDistance);
                if (euclideanDistance < maxMatchScore) {
                    maxMatchScore = euclideanDistance;
                    mostSimilarUser = oibc.getId();
                }
            }
        }

        return mostSimilarUser;
    }
    public List<Book> Recommend(String userId)
    {

        List<OrderInfoByCategory> ls=orderDao.getCategoryOrderInfo();

        String userId2=mostSimilarUser(ls,userId);
        return bookDao.recommendedBook(userId,userId2);

    }
    public int[] getInfoMatrix(List<OrderInfoByCategory> ls,String userId)
    {
        int[] res=new int[10];
        for(int i=0;i<ls.size();i++)
        {
            if(ls.get(i).getUser_id().equals(userId))
            {
                res[ls.get(i).getCategory_id()-1]=ls.get(i).getAmount();
            }
        }
            return res;
    }

    @Override
    public void submitReview(Review review) {
        reviewDao.createReview(review);
    }
    public boolean checkReview (String bookId,String userId){ return reviewDao.checkReview(bookId,userId);};

    @Override
    public List<Review> getReviewsByBookId(String bookId) {
        return bookDao.getReviewsByBookId(bookId);
    }
}
