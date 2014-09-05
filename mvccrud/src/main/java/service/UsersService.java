package service;

import model.Users;
import model.UsersAndRoles;

import java.util.List;

/**
 * Created by prasad on 9/5/14.
 */
public interface UsersService {
    boolean addusres(Users users);
    List<Users> getUsers(String email);
}
