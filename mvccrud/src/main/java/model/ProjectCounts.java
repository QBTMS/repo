package model;

/**
 * Created by prasad on 9/26/14.
 */
public class ProjectCounts {
    private int projectsCreated;
    private int projectsCompleted;
    private int groupTasksCreated;
    private int groupTasksReceived;
    private int groupTasksCompleted;

    public ProjectCounts() {
    }

    public ProjectCounts(int projectsCreated, int projectsCompleted, int groupTasksCreated, int groupTasksReceived, int groupTasksCompleted) {
        this.projectsCreated = projectsCreated;
        this.projectsCompleted = projectsCompleted;
        this.groupTasksCreated = groupTasksCreated;
        this.groupTasksReceived = groupTasksReceived;
        this.groupTasksCompleted = groupTasksCompleted;
    }

    public int getProjectsCreated() {
        return projectsCreated;
    }

    public void setProjectsCreated(int projectsCreated) {
        this.projectsCreated = projectsCreated;
    }

    public int getProjectsCompleted() {
        return projectsCompleted;
    }

    public void setProjectsCompleted(int projectsCompleted) {
        this.projectsCompleted = projectsCompleted;
    }

    public int getGroupTasksCreated() {
        return groupTasksCreated;
    }

    public void setGroupTasksCreated(int groupTasksCreated) {
        this.groupTasksCreated = groupTasksCreated;
    }

    public int getGroupTasksReceived() {
        return groupTasksReceived;
    }

    public void setGroupTasksReceived(int groupTasksReceived) {
        this.groupTasksReceived = groupTasksReceived;
    }

    public int getGroupTasksCompleted() {
        return groupTasksCompleted;
    }

    public void setGroupTasksCompleted(int groupTasksCompleted) {
        this.groupTasksCompleted = groupTasksCompleted;
    }
}
