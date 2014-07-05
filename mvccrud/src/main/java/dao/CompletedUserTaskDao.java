package dao;

import model.CompletedUserTask;

import java.util.List;

/**
 * Created by prasad on 6/8/14.
 */
public interface CompletedUserTaskDao {
    public void addCompletedUserTask(CompletedUserTask completedUserTask);

    public List<CompletedUserTask> listCompletedUserTask();

    public CompletedUserTask getCompletedUserTask(long completedUserTaskId);

    public void deleteCompletedUserTask(CompletedUserTask completedUserTask);

    public CompletedUserTask findById(long completedUserTaskId);
}
