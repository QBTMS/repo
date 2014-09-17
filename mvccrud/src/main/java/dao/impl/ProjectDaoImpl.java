package dao.impl;

import dao.ProjectDao;
import dao.UserDao;
import model.Project;
import model.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 8/7/14.
 */
@Repository("projectDao")
public class ProjectDaoImpl implements ProjectDao {

    @Autowired
    private UserDao userDao;

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addProject(Project project) {
        int ownerId = userDao.getUserId();
        project.setOwner(Long.parseLong(String.valueOf(ownerId)));
            sessionFactory.getCurrentSession().saveOrUpdate(project);
    }

    @Override
    public List<Project> listMyProject() {
        int ownerId = userDao.getUserId();
        return (List<Project>) sessionFactory.getCurrentSession().createQuery("from model.Project pt where pt.owner = '"+ownerId+"'").list();
    }

    @Override
    public List<Project> listMyProjectNames() {
        int ownerId = userDao.getUserId();
        String hql = "SELECT P.projectName,P.projectId FROM model.Project P WHERE P.owner = :ownerId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("ownerId", Long.parseLong(String.valueOf(ownerId)));
        List results = query.list();

        return results;
    }

    @Override
    public List<Project> listAsignedProject() {
        return null;
    }

    @Override
    public Project getProject(long projectId) {
        return (Project) sessionFactory.getCurrentSession().get(Project.class, projectId);
    }

    @Override
    public void deleteProject(Project project) {
        String hql = "DELETE FROM model.Project WHERE projectId = :projectId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectId", project.getProjectId());
        query.executeUpdate();
    }

    @Override
    public Project findById(long projectId) {
        String hql = "from Project where projectId = :projectId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectId", projectId);
        Project project =  (Project) query.uniqueResult();

        return project;
    }

    @Override
    public void update(long projectId, int completenessLevel) {
        String hql = "update model.Project set completenessLevel= :completenessLevel" +
                " where projectId = :projectId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectId", projectId);
        query.setParameter("completenessLevel", completenessLevel);
        query.executeUpdate();
    }
}
