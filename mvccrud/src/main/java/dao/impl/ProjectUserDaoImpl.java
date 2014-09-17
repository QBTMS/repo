package dao.impl;

import dao.ProjectUserDao;
import model.ProjectUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 8/7/14.
 */
@Repository("projectUserDao")
public class ProjectUserDaoImpl implements ProjectUserDao {
    @Override
    public void addProjectUser(ProjectUser projectUser) {

    }

    @Override
    public List<ProjectUser> listMyProject() {
        return null;
    }

    @Override
    public List<ProjectUser> listAsignedProject() {
        return null;
    }

    @Override
    public ProjectUser getProjectUser(long projectId) {
        return null;
    }

    @Override
    public void deleteProjectUser(ProjectUser projectUser) {

    }

    @Override
    public ProjectUser findById(long projectId) {
        return null;
    }

    @Override
    public void update(long projectId) {

    }
}
