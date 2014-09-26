package service.impl;

import dao.CompletedProjectTaskDao;
import model.CompletedProjectTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.CompletedProjectTaskService;

import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */
@Service("completedProjectTasksService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CompletedProjectTaskServiceImpl implements CompletedProjectTaskService {

    @Autowired
    private CompletedProjectTaskDao completedProjectTaskDao;

    @Override
    @Transactional
    public void addProjectTask(CompletedProjectTask projectTasks) {
        completedProjectTaskDao.addProjectTask(projectTasks);
    }

    @Override
    @Transactional
    public List<CompletedProjectTask> listMyProjectTasks() {
        return completedProjectTaskDao.listMyProjectTasks();
    }

    @Override
    @Transactional
    public List<CompletedProjectTask> allCompletedProjectTasks() {
        return completedProjectTaskDao.allCompletedProjectTasks();
    }

    @Override
    @Transactional
    public List<CompletedProjectTask> listAsignedProjectTasks() {
        return null;
    }

    @Override
    @Transactional
    public CompletedProjectTask getProjectTask(long projectTaskId) {
        return null;
    }

    @Override
    @Transactional
    public void deleteProjectTask(CompletedProjectTask projectTasks) {
        completedProjectTaskDao.deleteProjectTask(projectTasks);
    }

    @Override
    @Transactional
    public CompletedProjectTask findProjectTaskById(long projectTaskId) {
        return completedProjectTaskDao.findProjectTaskById(projectTaskId);
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
    @Transactional
    public void update(long projectTaskId, int completenessLevel) {

    }

    @Override
    public int taskCompletedCount() {
        return completedProjectTaskDao.taskCompletedCount();
    }
}
