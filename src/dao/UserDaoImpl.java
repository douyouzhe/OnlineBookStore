package dao;

import com.obs.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.JdbcUtils;

public class UserDaoImpl implements UserDao{

    public void add(User user){
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into user(id,username,password,tel,address,email) values(?,?,?,?,?,?,?)";
            Object params[] = {user.getId(), user.getUsername(), user.getPassword(), user.getTel(), user.getAddress(), user.getEmail()};
            runner.update(sql, params);
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    public User find(String id){
        try{

//            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//            String sql = "select * from user where id=?";
//            return (User)runner.query(sql, id, new BeanHandler(User.class));
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            ResultSetHandler<User> h = new BeanHandler<>(User.class);
            return runner.query(
                    "SELECT * FROM Person WHERE name=?", h, id);
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }

    public User find(String username, String password){
        try{
//            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
//            String sql = "select * from user where username=? and password=?";
//            Object params[] = {username, password};
//            return (User)runner.query(sql, params, new BeanHandler(User.class));
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where username=? and password=?";
            Object params[] = {username, password};
            ResultSetHandler<User> h = new BeanHandler<>(User.class);
            return runner.query(sql, h, params);
        } catch(Exception e){
            throw new RuntimeException(e);
        }
    }
}