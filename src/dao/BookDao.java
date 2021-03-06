package dao;

import java.util.List;

import com.obs.domain.Book;
import com.obs.domain.Review;

public interface BookDao {

	void add(Book book);

	Book find(String id);

	Book findByName(String bookName);
	
	List<Book> getPageData(int startindex, int pagesize);
	
	int getTotalRecord();

	List<Book> getPageData(int startindex, int pagesize, String category_id);
	

	int getTotalRecord(String category_id);
	List<Book> recommendedBook(String id,String id2);

	void updateRecord(String bookId, int storage, int sales);

	List<Review> getReviewsByBookId (String bookId);


}