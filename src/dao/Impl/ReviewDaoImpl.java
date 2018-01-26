package dao.Impl;


import com.obs.domain.Review;
import dao.ReviewDao;
import org.apache.commons.dbutils.QueryRunner;
import utils.JdbcUtils;


public class ReviewDaoImpl implements ReviewDao {

    @Override
    public void createReview(Review review) {
        try{
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

            String sql = "insert into review (id,book_id,user_id,score,feedback) values(?,?,?,?,?)";

            Object params[] = {review.getId(), review.getBook_id(), review.getUser_id(), review.getScore(), review.getFeedback()};
            runner.update(sql, params);

        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
