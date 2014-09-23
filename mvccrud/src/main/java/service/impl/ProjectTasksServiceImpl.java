package service.impl;

import dao.ProjectTasksDao;
import model.ProjectTasks;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.ProjectTasksService;

import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */

@Service("projectTasksService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ProjectTasksServiceImpl implements ProjectTasksService {

    @Autowired
    private ProjectTasksDao projectTasksDao;

    @Override
    @Transactional
    public void addProjectTask(ProjectTasks projectTasks) {
projectTasksDao.addProjectTask(projectTasks);
    }

    @Override
    @Transactional
    public List<ProjectTasks> listMyProjectTasks() {
        return projectTasksDao.listMyProjectTasks();
    }

    @Override
    @Transactional
    public List<ProjectTasks> listAsignedProjectTasks() {
        return null;
    }

    @Override
    @Transactional
    public ProjectTasks getProjectTask(long projectTaskId) {
        return projectTasksDao.getProjectTask(projectTaskId);
    }

    @Override
    @Transactional
    public void deleteProjectTask(ProjectTasks projectTasks) {
        projectTasksDao.deleteProjectTask(projectTasks);
    }

    @Override
    @Transactional
    public ProjectTasks findProjectTaskById(long projectTaskId) {
        return null;
    }

    @Override
    @Transactional
    public void updateProjectTask(long projectTaskId, int completenessLevel) {

    }

    @Override
    @Transactional
    public void findByProject(long project_id) {

    }

    @Override
    public void update(long projectTaskId, int completenessLevel) {
        projectTasksDao.update(projectTaskId, completenessLevel);
    }
}
