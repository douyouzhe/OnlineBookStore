package dao;

import java.util.List;
import java.util.Map;

import com.obs.domain.Book;
import com.obs.domain.Order;

public interface OrderDao {

	void add(Order order);

	Order find(String id);

	List<Order> getAll(boolean state);

	void update(Order order);

	List<Order> getAll(boolean state, String userid);

	List<Book> getAllBook(String id);
	 List<Order> getAllOrder(String userid);
}