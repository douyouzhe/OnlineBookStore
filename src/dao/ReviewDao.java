package dao;

import com.obs.domain.Review;

public interface ReviewDao {

     boolean checkReview(String bookId,String userId);
     void createReview(Review review);

}
