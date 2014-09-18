package dao.impl;

import dao.ProjectDao;
import dao.ProjectTasksDao;
import dao.UserDao;
import model.Project;
import model.ProjectTasks;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */
@Repository("projectTasksDao")
public class ProjectTasksDaoImpl implements ProjectTasksDao {

    @Autowired
    private ProjectDao projectDao;

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addProjectTask(ProjectTasks projectTasks) {
        sessionFactory.getCurrentSession().saveOrUpdate(projectTasks);
    }

    @Override
    public List<ProjectTasks> listMyProjectTasks() {
        List<Project> projectList;
        List<ProjectTasks> tempProjectTasksList = null;
        List<ProjectTasks> projectTasksList = new ArrayList<>();
        projectList =  projectDao.listMyProject();
        System.out.println("++++\nPL"+projectList.toString());
        if (projectList != null){
            for(int i = 0; i < projectList.size(); i++){
                long project_id = projectList.get(i).getProjectId();
                System.out.println("++++\nPID"+project_id);
                tempProjectTasksList = sessionFactory.getCurrentSession().createQuery("from model.ProjectTasks pt where pt.project_id = '"+project_id+"'").list();
                System.out.println("++++\nTPLSIZE"+tempProjectTasksList.size());
                if (tempProjectTasksList != null){
                    for(int x = 0; x < tempProjectTasksList.size(); x++){
                        System.out.println("++++\nI"+i);
                        System.out.println("++++\nX"+x);
                        System.out.println("++++\nTPTLITEM"+tempProjectTasksList.get(0));
                            projectTasksList.add(tempProjectTasksList.get(x));
                        }
                    tempProjectTasksList.clear();
                }
            }
        }

        System.out.println("++++\nTPTL"+tempProjectTasksList.toString());
        System.out.println("++++\nPTL"+projectTasksList.toString());
        return projectTasksList;
    }

    @Override
    public List<ProjectTasks> listAsignedProjectTasks() {
        return null;
    }

    @Override
    public ProjectTasks getProjectTask(long projectTaskId) {
        return null;
    }

    @Override
    public void deleteProjectTask(ProjectTasks projectTasks) {
        String hql = "DELETE FROM model.ProjectTasks WHERE projectTaskId = :projectTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectTaskId", projectTasks.getProjectTaskId());
        query.executeUpdate();
    }

    @Override
    public ProjectTasks findProjectTaskById(long projectTaskId) {
        return null;
    }

    @Override
    public void updateProjectTask(long projectTaskId, int completenessLevel) {

    }

    @Override
    public void findByProject(long project_id) {

    }

    @Override
    public void update(long projectTaskId, int completenessLevel) {
        String hql = "update model.ProjectTasks set completenessLevel= :completenessLevel" +
                " where projectTaskId = :projectTaskId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("projectTaskId", projectTaskId);
        query.setParameter("completenessLevel", completenessLevel);
        query.executeUpdate();
    }
}
