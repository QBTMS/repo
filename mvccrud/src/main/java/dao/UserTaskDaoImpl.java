package dao;

import model.User;
import model.UserTask;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 6/4/14.
 */
@Repository("userTaskDao")
public class UserTaskDaoImpl implements UserTaskDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addUserTask(UserTask userTask) {
        sessionFactory.getCurrentSession().saveOrUpdate(userTask);
    }

    @Override
    public List<UserTask> listUserTask() {
        Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
        String name = authentication.getName();
        return (List<UserTask>) sessionFactory.getCurrentSession().createQuery("from model.UserTask ut where ut.userName = '"+name+"'").list();
    }

    @Override
    public UserTask getUserTask(long userTaskId) {
        return (UserTask) sessionFactory.getCurrentSession().get(UserTask.class, userTaskId);
    }

    @Override
    public void deleteUserTask(UserTask userTask) {
        String hql = "DELETE FROM model.UserTask WHERE userTaskId = :userTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("userTaskId", userTask.getUserTaskId());
        query.executeUpdate();
    }

    @Override
    public UserTask findById(long userTaskId) {
        String hql = "from UserTask where userTaskid = :userTaskid";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("userTaskid", userTaskId);
        UserTask userTask =  (UserTask) query.uniqueResult();

        return userTask;
    }

    @Override
    public void update(long userTaskId, int completenessLevel) {
        String hql = "update model.UserTask set completenessLevel= :completenessLevel" +
                " where userTaskId = :userTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("userTaskId", userTaskId);
        query.setParameter("completenessLevel", completenessLevel);
        query.executeUpdate();
    }
}
