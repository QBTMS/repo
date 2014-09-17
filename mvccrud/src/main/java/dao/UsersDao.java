package dao;

import model.Users;
import model.UsersAndRoles;

import java.util.List;

/**
 * Created by prasad on 9/5/14.
 */
public interface UsersDao {
    boolean addusres(Users users);
    List<Users> getUsers(String email);
    public List<Users> listAllUserNames();

}
