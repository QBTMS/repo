package dao.impl;

import dao.UserDao;
import dao.UsersDao;
import model.Role;
import model.User;
import model.UserStatus;
import model.Users;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory session;

    @Autowired
    private UsersDao usersDao;
	
	@Override
	public boolean addUser(User user) {
        User user1 = findUserByName(user.getUsername()); //our own User model class

        if(user1==null){
            session.getCurrentSession().save(user);
            return true;
        }else
            return false;

	}

	@Override
	public void editUser(User user) {
		session.getCurrentSession().update(user);
	}

	@Override
	public void deleteUser(int userId) {
		session.getCurrentSession().delete(findUser(userId));
	}

	@Override
	public User findUser(int userId) {
		return (User) session.getCurrentSession().get(User.class, userId);
	}

	@Override
	public User findUserByName(String username) {
        System.out.println("============================="+username);
        List<User> users;

        users = session.getCurrentSession().createQuery("from model.User where username=?")
                .setParameter(0, username).list();

        if (users.size() > 0) {
            System.out.println("============================="+users.get(0));
            return users.get(0);
        } else {
            System.out.println("=============================");
            return null;
        }
//		Criteria criteria = session.getCurrentSession().createCriteria(User.class);
//		criteria.add(Restrictions.eq("username", username));
//        System.out.println(username+"  "+criteria.uniqueResult());
//        return (User) criteria.uniqueResult();
	}

	@Override
	public List<User> getAllUsers() {
        Criteria cr = session.getCurrentSession().createCriteria(User.class)
                .setProjection(Projections.projectionList()
                        .add(Projections.property("id"), "id")
                        .add(Projections.property("username"), "username"))
                .setResultTransformer(Transformers.aliasToBean(User.class));

        List<User> list = cr.list();
		return list;
	}

    @Override
    public void updateUserTaskLevel() {

    }

    @Override
    public int getUserId() {
        Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
        String ownerName = authentication.getName();

        List<Users> users = usersDao.getUsers(ownerName);
        for (int i =0; i < users.size(); i++){
            if (users.get(i).getUsername().equals(ownerName)){
                return users.get(i).getId();
            }
        }
        return 0;
    }

}
