package dao;

import model.Project;
import model.User;
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

    private UserDao userDao;

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addProject(Project project) {
            sessionFactory.getCurrentSession().saveOrUpdate(project);
    }

    @Override
    public List<Project> listMyProject() {
        int ownerId = userDao.getUserId();
        return (List<Project>) sessionFactory.getCurrentSession().createQuery("from model.Project pt where pt.owner = '"+ownerId+"'").list();
    }

    @Override
    public List<Project> listAsignedProject() {
        return null;
    }

    @Override
    public Project getProject(long projectId) {
        return null;
    }

    @Override
    public void deleteProject(Project project) {

    }

    @Override
    public Project findById(long projectId) {
        return null;
    }

    @Override
    public void update(long projectId, int completenessLevel) {

    }
}
