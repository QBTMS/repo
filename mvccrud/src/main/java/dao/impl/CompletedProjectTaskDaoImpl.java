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

import java.util.ArrayList;
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
        List<Project> projectList;
        List<CompletedProjectTask> tempProjectTasksList = null;
        List<CompletedProjectTask> projectTasksList = new ArrayList<>();
        projectList =  projectDao.listMyProject();
        System.out.println("++++\nPL"+projectList.toString());
        if (projectList != null){
            for(int i = 0; i < projectList.size(); i++){
                long project_id = projectList.get(i).getProjectId();
                System.out.println("++++\nCPID"+project_id);
                tempProjectTasksList = sessionFactory.getCurrentSession().createQuery("from model.CompletedProjectTask cpt where cpt.project_id = '"+project_id+"'").list();
                System.out.println("++++\nCTPLSIZE"+tempProjectTasksList.size());
                if (tempProjectTasksList != null){
                    for(int x = 0; x < tempProjectTasksList.size(); x++){
                        System.out.println("++++\nCI"+i);
                        System.out.println("++++\nCX"+x);
                        System.out.println("++++\nCTPTLITEM"+tempProjectTasksList.get(0));
                        projectTasksList.add(tempProjectTasksList.get(x));
                    }
                    tempProjectTasksList.clear();
                }
            }
        }

        System.out.println("++++\nCTPTL"+tempProjectTasksList.toString());
        System.out.println("++++\nCPTL"+projectTasksList.toString());
        return projectTasksList;
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
