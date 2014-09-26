package dao;

import model.Project;

import java.util.List;

/**
 * Created by prasad on 8/7/14.
 */
public interface ProjectDao {
    public void addProject(Project project);

    public List<Project> listMyProject();

    public List<Project> listAllProjects();

    public List<Project> listMyProjectNames();

    public List<Project> listAsignedProject();

    public Project getProject(long projectId);

    public void deleteProject(Project project);

    public Project findById(long projectId);

    public void update(long projectId, int completenessLevel);

    public int projectCount();



}
