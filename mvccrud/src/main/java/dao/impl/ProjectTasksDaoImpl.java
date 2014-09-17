package dao.impl;

import dao.ProjectTasksDao;
import dao.UserDao;
import model.ProjectTasks;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */
@Repository("projectTasksDao")
public class ProjectTasksDaoImpl implements ProjectTasksDao {

    @Autowired
    private UserDao userDao;

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addProjectTask(ProjectTasks projectTasks) {

    }

    @Override
    public List<ProjectTasks> listMyProjectTasks() {
        return null;
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
}
