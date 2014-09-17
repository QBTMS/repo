package dao.impl;

import dao.UsersDao;
import model.User;
import model.Users;
import model.UsersAndRoles;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
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

    @Override
    public List<Users> listAllUserNames() {
        Criteria cr = sessionFactory.getCurrentSession().createCriteria(Users.class)
                .setProjection(Projections.projectionList()
                        .add(Projections.property("id"), "id")
                        .add(Projections.property("name"), "name"))
                .setResultTransformer(Transformers.aliasToBean(Users.class));

        List<Users> list = cr.list();
        return list;
    }

}
