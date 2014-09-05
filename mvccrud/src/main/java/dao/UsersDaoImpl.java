package dao;

import model.User;
import model.Users;
import model.UsersAndRoles;
import org.hibernate.SessionFactory;
import org.omg.CosNaming._NamingContextExtStub;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 9/5/14.
 */
@Repository("usersDao")
public class UsersDaoImpl implements UsersDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean addusres(Users users) {
        sessionFactory.getCurrentSession().saveOrUpdate(users);
        return true;
    }

    @Override
    public List<Users> getUsers(String email) {
        return sessionFactory.getCurrentSession().createQuery("from model.Users u where u.username = '"+email+"'").list();
    }

}
