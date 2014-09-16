package service;

import dao.ProjectDao;
import model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by prasad on 8/8/14.
 */
@Service("projectService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectDao projectDao;

    @Override
    @Transactional
    public void addProject(Project project) {
            projectDao.addProject(project);
    }

    @Override
    @Transactional
    public List<Project> listMyProject() {
        return projectDao.listMyProject();
    }

    @Override
    @Transactional
    public List<Project> listAsignedProject() {
        return null;
    }

    @Override
    @Transactional
    public Project getProject(long projectId) {
        return projectDao.getProject(projectId);
    }

    @Override
    @Transactional
    public void deleteProject(Project project) {
        projectDao.deleteProject(project);
    }

    @Override
    @Transactional
    public Project findById(long projectId) {
        return null;
    }

    @Override
    @Transactional
    public void update(long projectId, int completenessLevel) {
projectDao.update(projectId,completenessLevel);
    }
}
