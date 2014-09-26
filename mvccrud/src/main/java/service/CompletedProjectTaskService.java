package service;

import model.CompletedProjectTask;

import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */
public interface CompletedProjectTaskService {
    public void addProjectTask(CompletedProjectTask projectTasks);

    public List<CompletedProjectTask> listMyProjectTasks();

    public List<CompletedProjectTask> allCompletedProjectTasks();

    public List<CompletedProjectTask> listAsignedProjectTasks();

    public CompletedProjectTask getProjectTask(long projectTaskId);

    public void deleteProjectTask(CompletedProjectTask projectTasks);

    public CompletedProjectTask findProjectTaskById(long projectTaskId);

    public void updateProjectTask(long projectTaskId, int completenessLevel);

    public void findByProject(long project_id);

    public void update(long projectTaskId, int completenessLevel);

    public int taskCompletedCount();

}
