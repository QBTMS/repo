package dao.impl;

import dao.CompletedProjectDao;
import dao.UserDao;
import model.CompletedProject;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 9/16/14.
 */
@Repository("completedProjectDao")
public class CompletedProjectDaoImpl implements CompletedProjectDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private UserDao userDao;

    @Override
    public void addCompletedProject(CompletedProject completedproject) {
        sessionFactory.getCurrentSession().save(completedproject);
    }

    @Override
    public List<CompletedProject> listMyCompletedProject() {
        int ownerId = userDao.getUserId();
        return (List<CompletedProject>) sessionFactory.getCurrentSession().createQuery("from model.CompletedProject pt where pt.owner = '"+ownerId+"'").list();
    }

    @Override
    public List<CompletedProject> listAsignedCompletedProject() {
        return null;
    }

    @Override
    public CompletedProject getCompletedProject(long projectId) {
        return null;
    }

    @Override
    public void deleteCompletedProject(CompletedProject completedproject) {
        String hql = "DELETE FROM model.CompletedProject WHERE projectId = :projectId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectId", completedproject.getProjectId());
        query.executeUpdate();
    }

    @Override
    public CompletedProject findById(long projectId) {
        String hql = "from model.CompletedProject where projectId = :projectId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectId", projectId);
        CompletedProject completedProject =  (CompletedProject) query.uniqueResult();

        return completedProject;
    }

    @Override
    public void completedUpdate(long projectId, int completenessLevel) {

    }
}
