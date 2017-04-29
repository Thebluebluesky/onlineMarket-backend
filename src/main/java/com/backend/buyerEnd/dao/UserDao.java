package main.java.com.backend.buyerEnd.dao;

import main.java.com.backend.buyerEnd.model.User;
import java.util.List;

public interface UserDao {
	public List<User> listUser();
	public User getUserByUserID(String userId);
	public void removeUser(String userId);
}
