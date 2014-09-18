package dao.impl;

import dao.CompletedProjectTaskDao;
import dao.ProjectDao;
import dao.UserDao;
import dao.UsersDao;
import model.CompletedProjectTask;
import model.Project;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */
@Repository("completedProjectTaskDao")
public class CompletedProjectTaskDaoImpl implements CompletedProjectTaskDao{

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private ProjectDao projectDao;

    @Override
    public void addProjectTask(CompletedProjectTask projectTasks) {
            sessionFactory.getCurrentSession().saveOrUpdate(projectTasks);
    }

    @Override
    public List<CompletedProjectTask> listMyProjectTasks() {
        Project project;
        project = (Project) projectDao.listMyProject();
        long project_id = project.getProjectId();
        return (List<CompletedProjectTask>) sessionFactory.getCurrentSession().createQuery("from model.CompletedProjectTask cpt where cpt.project_id = '"+project_id+"'").list();
    }

    @Override
    public List<CompletedProjectTask> listAsignedProjectTasks() {
        return null;
    }

    @Override
    public CompletedProjectTask getProjectTask(long projectTaskId) {
        return null;
    }

    @Override
    public void deleteProjectTask(CompletedProjectTask projectTasks) {
        String hql = "DELETE FROM model.CompletedProjectTask WHERE projectTaskId = :projectTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectTaskId", projectTasks.getProjectTaskId());
        query.executeUpdate();
    }

    @Override
    public CompletedProjectTask findProjectTaskById(long projectTaskId) {
        String hql = "from model.CompletedProjectTask where projectTaskId = :projectTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectTaskId", projectTaskId);
        CompletedProjectTask completedProjectTask =  (CompletedProjectTask) query.uniqueResult();

        return completedProjectTask;
    }

    @Override
    public void updateProjectTask(long projectTaskId, int completenessLevel) {

    }

    @Override
    public void findByProject(long project_id) {

    }

    @Override
    public void update(long projectTaskId, int completenessLevel) {

    }
}
