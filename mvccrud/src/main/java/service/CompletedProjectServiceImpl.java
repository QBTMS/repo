package service;

import dao.CompletedProjectDao;
import model.CompletedProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by prasad on 9/16/14.
 */
@Service("completedProjectService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CompletedProjectServiceImpl implements CompletedProjectService {

    @Autowired
    private CompletedProjectDao completedProjectDao;

    @Override
    public void addCompletedProject(CompletedProject completedproject) {
        completedProjectDao.addCompletedProject(completedproject);
    }

    @Override
    public List<CompletedProject> listMyCompletedProject() {
        return completedProjectDao.listMyCompletedProject();
    }

    @Override
    public List<CompletedProject> listAsignedCompletedProject() {
        return null;
    }

    @Override
    public CompletedProject getCompletedProject(long projectId) {
        return null;
    }

    @Override
    public void deleteCompletedProject(CompletedProject completedproject) {
completedProjectDao.deleteCompletedProject(completedproject);
    }

    @Override
    public CompletedProject findById(long projectId) {
        return completedProjectDao.findById(projectId);
    }

    @Override
    public void completedUpdate(long projectId, int completenessLevel) {

    }
}
