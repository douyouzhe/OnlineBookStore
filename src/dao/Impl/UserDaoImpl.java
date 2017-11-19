package dao.Impl;


import com.obs.domain.User;
import dao.UserDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.JdbcUtils;


public class UserDaoImpl implements UserDao {
    public void add(User user)
    {
        try
        {
            //System.out.println("before JdbcUtils.getDataSource(");
            QueryRunner run =new QueryRunner(JdbcUtils.getDataSource());
            String sql="insert into user(id,username,password,tel,email,address) values(?,?,?,?,?,?)";
            Object[] params = {user.getId(), user.getUsername(), user.getPassword(), user.getTel(),user.getEmail(),user.getAddress()};
            //System.out.println("after JdbcUtils.getDataSource(");

            run.update(sql, params);

        }catch(Exception ex)
        {
            throw new RuntimeException(ex);
        }

    }
    public User find(String id){
        try{
            QueryRunner run = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where id=?";
            return (User)run.query(sql,  new BeanHandler(User.class),id);
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
    }
    public User findUser(String username){
        try{
            QueryRunner run = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where username=?";
            return (User)run.query(sql,  new BeanHandler(User.class),username);
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
    }
    public User find(String username, String password){
        try{
            QueryRunner run = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where username=? and password=?";
            Object params[] = {username, password};
            return (User)run.query(sql,  new BeanHandler(User.class),params);
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
    }
}

