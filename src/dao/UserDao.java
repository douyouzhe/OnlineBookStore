package dao;

import com.obs.domain.User;

import java.util.List;

public interface UserDao {
    void add(User user);
    User find(String id);
    User findUser(String username);
    User find(String username, String password);
    List<User> findAllUsers();
}
