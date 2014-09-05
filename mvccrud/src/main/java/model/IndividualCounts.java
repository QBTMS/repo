package model;

/**
 * Created by prasad on 8/24/14.
 */
public class IndividualCounts {
    private int tasksCreated;
    private int tasksCompleted;
    private int tasksToComplete;
    private float taskCompletenessRate;

    public int getTasksCreated() {
        return tasksCreated;
    }

    public void setTasksCreated(int tasksCreated) {
        this.tasksCreated = tasksCreated;
    }

    public int getTasksCompleted() {
        return tasksCompleted;
    }

    public void setTasksCompleted(int tasksCompleted) {
        this.tasksCompleted = tasksCompleted;
    }

    public int getTasksToComplete() {
        return tasksToComplete;
    }

    public void setTasksToComplete(int tasksToComplete) {
        this.tasksToComplete = tasksToComplete;
    }

    public float getTaskCompletenessRate() {
        return (tasksCompleted / tasksCreated) * 100;

    }

    public void setTaskCompletenessRate(float taskCompletenessRate) {
        this.taskCompletenessRate = taskCompletenessRate;
    }
}
