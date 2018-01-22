package dao;

import java.util.List;

import com.obs.domain.Book;

public interface BookDao {

	void add(Book book);

	Book find(String id);

	Book findByName(String bookName);
	
	List<Book> getPageData(int startindex, int pagesize);
	
	int getTotalRecord();

	List<Book> getPageData(int startindex, int pagesize, String category_id);
	
	int getTotalRecord(String category_id);

	void updateRecord(String bookId, int storage, int sales);



}