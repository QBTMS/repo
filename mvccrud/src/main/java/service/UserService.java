package service;

import model.User;
import model.Users;

import java.util.List;

/**
 * Created by prasad on 8/26/14.
 */
public interface UserService {
    boolean addUser(User user);
    void editUser(User user);
    void deleteUser(int userId);
    User findUser(int userId);
    User findUserByName(String username);
    List<Users> getAllUsers();
    void updateUserTaskLevel();
    int getUserId();
}
