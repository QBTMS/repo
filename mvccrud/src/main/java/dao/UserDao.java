package dao;

import model.User;
import model.User;
import model.Users;

import java.util.List;

public interface UserDao {
	boolean addUser(User user);
	void editUser(User user);
	void deleteUser(int userId);
	User findUser(int userId);
	User findUserByName(String username);
	List<User> getAllUsers();
    void updateUserTaskLevel();
    int getUserId();
}
