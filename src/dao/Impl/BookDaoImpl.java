package dao.Impl;

import com.obs.domain.Book;
import com.obs.domain.Review;
import dao.BookDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BookDaoImpl implements BookDao {
    public void add(Book book){
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into book(id,name,author,price,image,description,language,storage,category_id) values(?,?,?,?,?,?,?,?,?)";
            Object params[] = {book.getId(), book.getName(), book.getAuthor(), book.getPrice(), book.getImage(), book.getDescription(),book.getLanguage(),book.getStorage(), book.getCategory_id()};
            runner.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public Book find(String id){
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from book where id=?";
            return (Book)runner.query(sql, new BeanHandler(Book.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public Book findByName(String bookName){
        try{
            QueryRunner runner=new QueryRunner(JdbcUtils.getDataSource());
            String sql="select * from book where name=?";
            return (Book)runner.query(sql, new BeanHandler(Book.class), bookName);


        }catch(SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Book> getPageData(int startindex, int pagesize){
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from book ORDER BY sales DESC limit ?,?";
            Object params[] = {startindex, pagesize};
            return (List<Book>)runner.query(sql, new BeanListHandler(Book.class), params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public int getTotalRecord(){
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select count(*) from book ORDER BY sales DESC";
            long totalRecord = (Long)runner.query(sql, new ScalarHandler());
            return (int)totalRecord;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public List<Book> getPageData(int startindex, int pagesize, String category_id){
        try {
            startindex--;
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from book where category_id=? ORDER BY sales DESC limit ?,?";
            Object params[] = {category_id, startindex,pagesize};

            List list=(List<Book>)runner.query(sql, new BeanListHandler(Book.class), params);

            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public int getTotalRecord(String category_id){
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select count(*) from book where category_id=? ORDER BY sales DESC";
            long totalRecord = (Long)runner.query(sql, new ScalarHandler(), category_id);
            return (int)totalRecord;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Book> getBookByUser(String id)
    {
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select book.* FROM book,orders,orderitem Where orders.id=orderitem.order_id and orderitem.book_id=book.id and orders.user_id=?";

            return (List<Book>)runner.query(sql, new BeanListHandler(Book.class), id);
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public List<Book> recommendedBook(String id,String id2) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select distinct book.* FROM book,orders,orderitem Where orders.id=orderitem.order_id and orderitem.book_id=book.id and orders.user_id=? and book.id not in (select book.id FROM book,orders,orderitem Where orders.id=orderitem.order_id and orderitem.book_id=book.id and orders.user_id=? ) order by book.sales DESC";
            Object params[] = {id, id2};
            return (List<Book>) runner.query(sql, new BeanListHandler(Book.class), params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public void updateRecord(String bookId, int storage, int sales){
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "update book set storage=?, sales=? where id=?";
            Object params[] = {storage, sales,bookId};
            runner.update(sql,params);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Review> getReviewsByBookId(String bookId) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from review where book_id=?";
            Object params[] = {bookId};
            return (List<Review>) runner.query(sql, new BeanListHandler(Review.class), params);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
