package service.impl;

import dao.CompletedUserTaskDao;
import model.CompletedUserTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.CompletedUserTaskService;

import java.util.List;

/**
 * Created by prasad on 6/8/14.
 */
@Service("completedUserTaskService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CompletedUserTaskServiceImpl implements CompletedUserTaskService {

    @Autowired
    private CompletedUserTaskDao completedUserTaskDao;

    @Override
    public void addCompletedUserTask(CompletedUserTask completedUserTask) {
        System.out.println("\n\n\n\n\n\ncalledService\n\n\n\n\n\n" + completedUserTask.getUserTaskName());
        completedUserTaskDao.addCompletedUserTask(completedUserTask);
    }

    @Override
    public List<CompletedUserTask> listCompletedUserTask() {
        return completedUserTaskDao.listCompletedUserTask();
    }

    @Override
    public CompletedUserTask getCompletedUserTask(long completedUserTaskId) {
        return null;
    }

    @Override
    public void deleteCompletedUserTask(CompletedUserTask completedUserTask) {
        completedUserTaskDao.deleteCompletedUserTask(completedUserTask);
    }

    @Override
    public CompletedUserTask findById(long completedUserTaskId) {
        return completedUserTaskDao.findById(completedUserTaskId);
    }
}
