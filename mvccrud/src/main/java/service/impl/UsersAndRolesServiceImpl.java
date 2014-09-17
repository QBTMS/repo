package service.impl;

import dao.UsersAndRolesDao;
import model.UsersAndRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.UsersAndRolesService;

/**
 * Created by prasad on 9/5/14.
 */
@Service("usersAndRolesService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UsersAndRolesServiceImpl implements UsersAndRolesService {

    @Autowired
    private UsersAndRolesDao usersAndRolesDao;

    @Override
    @Transactional
    public void addRoles(UsersAndRoles usersAndRoles) {
        usersAndRolesDao.addRoles(usersAndRoles);
    }
}
