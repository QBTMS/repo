package dao;

import model.Role;
import model.User;
import model.UserStatus;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SessionFactory session;
	
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
		Criteria criteria = session.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("username", username));
		return (User) criteria.uniqueResult();
	}

	@Override
	public List<User> getAllUsers() {
		return session.getCurrentSession().createQuery("from user").list();
	}

    @Override
    public void updateUserTaskLevel() {

    }

}
