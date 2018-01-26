package dao.Impl;


import com.obs.domain.Review;
import dao.ReviewDao;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JdbcUtils;

import java.util.List;


public class ReviewDaoImpl implements ReviewDao {

    @Override
    public void createReview(Review review) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

            String sql = "insert into review (id,book_id,user_id,score,feedback) values(?,?,?,?,?)";

            Object params[] = {review.getId(), review.getBook_id(), review.getUser_id(), review.getScore(), review.getFeedback()};
            runner.update(sql, params);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    public boolean checkReview(String bookId,String userId) {
        try {
            QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());

            String sql = "select * from review where book_id=? AND user_id=?";

            Object params[] = {bookId, userId};
            List<Review> reviewList = (List<Review>) runner.query(sql, new BeanListHandler(Review.class), params);
            return reviewList.size() == 0;
        } catch(Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }    }
}
