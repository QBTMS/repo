package service;

import model.ProjectUser;

import java.util.List;

/**
 * Created by prasad on 8/8/14.
 */
public interface ProjectUserService {
    public void addProjectUser(ProjectUser projectUser);

    public List<ProjectUser> listMyProject();

    public List<ProjectUser> listAsignedProject();

    public ProjectUser getProjectUser(long projectId);

    public void deleteProjectUser(ProjectUser projectUser);

    public ProjectUser findById(long projectId);

    public void update(long projectId);
}
