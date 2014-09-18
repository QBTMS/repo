package dao;

import model.ProjectTasks;

import java.util.List;

/**
 * Created by prasad on 9/17/14.
 */
public interface ProjectTasksDao {
    public void addProjectTask(ProjectTasks projectTasks);

    public List<ProjectTasks> listMyProjectTasks();

    public List<ProjectTasks> listAsignedProjectTasks();

    public ProjectTasks getProjectTask(long projectTaskId);

    public void deleteProjectTask(ProjectTasks projectTasks);

    public ProjectTasks findProjectTaskById(long projectTaskId);

    public void updateProjectTask(long projectTaskId, int completenessLevel);

    public void findByProject(long project_id);

    public void update(long projectTaskId, int completenessLevel);
}
