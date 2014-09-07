package dao;

import model.CompletedUserTask;
import model.UserTask;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 6/8/14.
 */

@Repository("completedUserTaskDao")
public class CompletedUserTaskDaoImpl implements CompletedUserTaskDao {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void addCompletedUserTask(CompletedUserTask completedUserTask) {
        System.out.println("\n\n\n\n\n\ncalledDao\n\n\n\n\n\n" + completedUserTask.getUserTaskName());
        sessionFactory.getCurrentSession().save(completedUserTask);
    }

    @Override
    public List<CompletedUserTask> listCompletedUserTask() {
        Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
        String name = authentication.getName();

        return (List<CompletedUserTask>) sessionFactory.getCurrentSession().createQuery("from model.CompletedUserTask cut where cut.userName = '"+name+"'").list();
    }

    @Override
    public CompletedUserTask getCompletedUserTask(long completedUserTaskId) {
        return null;
    }

    @Override
    public void deleteCompletedUserTask(CompletedUserTask completedUserTask) {
        String hql = "DELETE FROM model.CompletedUserTask WHERE userTaskId = :userTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("userTaskId", completedUserTask.getUserTaskId());
        query.executeUpdate();
    }

    @Override
    public CompletedUserTask findById(long completedUserTaskId) {
        String hql = "from model.CompletedUserTask where userTaskid = :userTaskid";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("userTaskid", completedUserTaskId);
        CompletedUserTask completedUserTask =  (CompletedUserTask) query.uniqueResult();

        return completedUserTask;
    }
}
//