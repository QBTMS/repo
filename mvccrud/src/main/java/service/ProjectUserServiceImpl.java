package service;

import dao.ProjectUserDao;
import model.ProjectUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by prasad on 8/8/14.
 */
@Service("projectUserService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ProjectUserServiceImpl implements ProjectUserService {

    @Autowired
    private ProjectUserDao projectUserDao;

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
