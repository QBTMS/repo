package service.impl;

import dao.UsersDao;
import model.Users;
import model.UsersAndRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.UsersService;

import java.util.List;

/**
 * Created by prasad on 9/5/14.
 */
@Service("usersService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDao usersDao;

    @Override
    @Transactional
    public boolean addusres(Users users) {
        usersDao.addusres(users);
        return true;
    }

    @Override
    public List<Users> getUsers(String email) {
        return usersDao.getUsers(email);
    }

    @Override
    public List<Users> listAllUserNames() {
        return usersDao.listAllUserNames();
    }
}
