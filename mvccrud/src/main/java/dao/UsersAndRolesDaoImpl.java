package dao;

import model.UsersAndRoles;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by prasad on 9/5/14.
 */
@Repository("usersAndRoles")
public class UsersAndRolesDaoImpl implements UsersAndRolesDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addRoles(UsersAndRoles usersAndRoles) {
        sessionFactory.getCurrentSession().saveOrUpdate(usersAndRoles);
    }
}
