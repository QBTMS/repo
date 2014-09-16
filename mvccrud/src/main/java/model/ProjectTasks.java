package model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by prasad on 9/8/14.
 */
@Entity
@Table(name = "projectTasks")
public class ProjectTasks {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "projectTaskId")
    private Long projectTaskId;

    @Column(name = "project_id")
    private Long project_id;

    @Column(name = "asignee")
    private int asignee;

    @Column(name = "projectTaskName")
    private String projectTaskName;

    @Column(name = "projectTaskDiscription")
    private String projectTaskDiscription;

    @Column(name = "startedDate", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date startedDate;

    @Column(name = "toBeCompleted", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date toBeCompleted;

    @Column(name = "completedDate", columnDefinition="DATETIME")
    @Temporal(TemporalType.TIMESTAMP)
    private java.util.Date completedDate;

    @Column(name = "completenessLevel")
    private int completenessLevel;

    @Column(name = "priority")
    private int priority;

    public ProjectTasks() {
    }

    public ProjectTasks(Long project_id, int asignee, String projectTaskName, String projectTaskDiscription, Date startedDate, Date toBeCompleted, Date completedDate, int completenessLevel, int priority) {
        this.project_id = project_id;
        this.asignee = asignee;
        this.projectTaskName = projectTaskName;
        this.projectTaskDiscription = projectTaskDiscription;
        this.startedDate = startedDate;
        this.toBeCompleted = toBeCompleted;
        this.completedDate = completedDate;
        this.completenessLevel = completenessLevel;
        this.priority = priority;
    }

    public Long getProjectTaskId() {
        return projectTaskId;
    }

    public void setProjectTaskId(Long projectTaskId) {
        this.projectTaskId = projectTaskId;
    }

    public Long getProject_id() {
        return project_id;
    }

    public void setProject_id(Long project_id) {
        this.project_id = project_id;
    }

    public int getAsignee() {
        return asignee;
    }

    public void setAsignee(int asignee) {
        this.asignee = asignee;
    }

    public String getProjectTaskName() {
        return projectTaskName;
    }

    public void setProjectTaskName(String projectTaskName) {
        this.projectTaskName = projectTaskName;
    }

    public String getProjectTaskDiscription() {
        return projectTaskDiscription;
    }

    public void setProjectTaskDiscription(String projectTaskDiscription) {
        this.projectTaskDiscription = projectTaskDiscription;
    }

    public Date getStartedDate() {
        return startedDate;
    }

    public void setStartedDate(Date startedDate) {
        this.startedDate = startedDate;
    }

    public Date getToBeCompleted() {
        return toBeCompleted;
    }

    public void setToBeCompleted(Date toBeCompleted) {
        this.toBeCompleted = toBeCompleted;
    }

    public Date getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(Date completedDate) {
        this.completedDate = completedDate;
    }

    public int getCompletenessLevel() {
        return completenessLevel;
    }

    public void setCompletenessLevel(int completenessLevel) {
        this.completenessLevel = completenessLevel;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }
}
