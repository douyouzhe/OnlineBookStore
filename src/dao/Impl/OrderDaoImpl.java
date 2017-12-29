package dao.Impl;

import com.obs.domain.Book;
import com.obs.domain.Order;
import com.obs.domain.OrderItem;
import com.obs.domain.User;
import dao.OrderDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class OrderDaoImpl implements OrderDao {
    public void add(Order order){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

            String sql = "insert into orders(id,ordertime,price,state,user_id) values(?,?,?,?,?)";
            Object params[] = {order.getId(), order.getOrderTime(), order.getPrice(), order.isState(), order.getUser().getId()};
            runner.update(sql, params);

            Set<OrderItem> set = order.getOrderItems();

            for(OrderItem item : set){
                sql = "insert into orderitem(id,quantity,price,order_id,book_id) values(?,?,?,?,?)";
                params = new Object[]{item.getId(), item.getQuantity(), item.getPrice(), order.getId(), item.getBook().getId()};
                runner.update(sql, params);
            }
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public Order find(String id){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

            String sql = "select * from orders where id=?";
            Order order = (Order) runner.query(sql, new BeanHandler(Order.class),id);

            sql = "select * from orderitem where order_id=?";
            List<OrderItem> list =(List<OrderItem>) runner.query(sql,new BeanListHandler(OrderItem.class),id);
            for(OrderItem item : list){
                sql = "select book.* from orderitem,book where orderitem.id=? and orderitem.book_id=book.id";
                Book book = (Book) runner.query(sql, new BeanHandler(Book.class), item.getId());
                item.setBook(book);
            }

            order.getOrderItems().addAll(list);

            sql = "select * from orders,user where orders.id=? and orders.user_id=user.id";
            User user = (User) runner.query(sql, new BeanHandler(User.class), order.getId());
            order.setUser(user);
            return order;

        }catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public List<Order> getAll(boolean state){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from orders where state=?";
            List<Order> list = (List<Order>) runner.query(sql, new BeanListHandler(Order.class), state);
            for(Order order : list){
                sql = "select user.* from orders,user where orders.id=? and orders.user_id=user.id";
                User user = (User) runner.query(sql, new BeanHandler(User.class), order.getId());
                order.setUser(user);
            }
            return list;
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Order> getAll(boolean state, String userid){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from orders where state=? and orders.user_id=?";
            Object params[] = {state, userid};
            List<Order> list = (List<Order>) runner.query(sql, new BeanListHandler(Order.class), params);
            for(Order order : list){
                sql = "select * from user where user.id=?";
                User user = (User) runner.query(sql, new BeanHandler(User.class), userid);
                order.setUser(user);
            }
            return list;
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public List<Order> getAllOrder(String userid){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from orders where user_id=?";
            List<Order> list = (List<Order>) runner.query(sql, new BeanListHandler(Order.class), userid);
            for(Order order : list){
                sql = "select * from user where id=?";
                User user = (User) runner.query(sql, new BeanHandler(User.class), userid);
                order.setUser(user);
            }
            return list;
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public void update(Order order){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "update orders set state=? where id=?";
            Object params[] = {order.isState(), order.getId()};
            runner.update(sql, params);
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    public Map<String,Integer> getAllBook(String id)
    {
        try{
            String sql2 = "select book.name, orderitem.quantity FROM book,orders,orderitem Where orders.id='" +id+
                    "' and orders.id=orderitem.order_id and orderitem.book_id=book.id";

            Connection connect = JdbcUtils.getDataSource().getConnection();
            Statement st = connect.createStatement();
            ResultSet rs = st.executeQuery(sql2);
            Map<String,Integer> map = new HashMap<>();

            while(rs.next()){
                String name = rs.getString(1);
                int amount = rs.getInt(2);
                map.put(name,amount);
            }
            connect.close();
            rs.close();
            return map;
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}

