package service;

import model.UserTask;

import java.util.List;

/**
 * Created by prasad on 6/4/14.
 */
public interface UserTaskService {
    public void addUserTask(UserTask userTask);

    public List<UserTask> listUserTask();

    public UserTask getUserTask(long userTaskId);

    public void deleteUserTask(UserTask userTask);

    public UserTask findById(long userTaskId);

    public void update(long userTaskId, int completenessLevel);
}
