package dao.impl;

import dao.UserTaskCompletenessLevelDao;
import model.UserTask;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by prasad on 6/8/14.
 */
@Repository("userTaskCompletenessLevelDaoImpl")
public class UserTaskCompletenessLevelDaoImpl implements UserTaskCompletenessLevelDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void updateUserTaskLevel(long userTaskId, int completenessLevel) {
        String hql = "insert into userTaskCompletenessLevel(completenessLevel) values(completenessLevel) where userTaskid = :userTaskid";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("userTaskid", userTaskId);
        query.executeUpdate();
    }

}
