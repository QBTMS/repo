package service;

import dao.UserTaskDao;
import model.UserTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by prasad on 6/4/14.
 */
@Service("userTaskService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class UserTaskServiceImpl implements UserTaskService{

    @Autowired
    private UserTaskDao userTaskDao;

    @Override
    @Transactional
    public void addUserTask(UserTask userTask) {
        userTaskDao.addUserTask(userTask);
    }

    @Override
    @Transactional
    public List<UserTask> listUserTask() {
        return userTaskDao.listUserTask();
    }

    @Override
    @Transactional
    public UserTask getUserTask(long userTaskId) {
        return userTaskDao.getUserTask(userTaskId);
    }

    @Override
    @Transactional
    public void deleteUserTask(UserTask userTask) {
        userTaskDao.deleteUserTask(userTask);
    }

    @Override
    @Transactional
    public UserTask findById(long userTaskId) {
        return userTaskDao.findById(userTaskId);
    }

    @Override
    public void update(long userTaskId, int completenessLevel) {
        userTaskDao.update(userTaskId,completenessLevel);
    }

    @Override
    public int getAllUserTaskCount() {
        return userTaskDao.getAllUserTaskCount();
    }

    @Override
    public int getCompletedUserTaskCount() {
        return userTaskDao.getCompletedUserTaskCount();
    }

    @Override
    public int getIncompleteUserTaskCount() {
        return userTaskDao.getIncompleteUserTaskCount();
    }
}
