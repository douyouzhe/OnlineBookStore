
package dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.JdbcUtils;
import dao.CategoryDao;
import com.obs.domain.Category;

public class CategoryDaoImpl implements CategoryDao {


    @Override
    public void add(Category category){
        try{
            QueryRunner run= new QueryRunner(JdbcUtils.getDataSource());
            String sql="insert int category(id,name,description) values(?,?,?)";
            Object[] params={category.getId(),category.getName(),category.getDescription()};
            run.update(sql,params);
        }catch(Exception ex){
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

    @Override
    public Category find(String id){
        try {
            QueryRunner run = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from category where id=?";
            return (Category)run.query(sql, new BeanHandler(Category.class),id);
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }


    @Override
    public List<Category> getAll(){
        try {
            QueryRunner run = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from category";
            return (List<Category>)run.query(sql, new BeanListHandler(Category.class));
        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new RuntimeException(ex);
        }
    }

}
