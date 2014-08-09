package model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by prasad on 8/7/14.
 */
@Entity
@Table(name = "project")
public class Project {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "projectId")
    private Long projectId;

    @Column(name = "owner")
    private Long owner;

    @Column(name = "projecName")
    private String projecName;

    @Column(name = "projecDiscription")
    private String projecDiscription;

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

    public Project() {
    }

    public Project(Long owner, String projecName, String projecDiscription, Date startedDate, Date toBeCompleted, Date completedDate, int completenessLevel, int priority) {
        this.owner = owner;
        this.projecName = projecName;
        this.projecDiscription = projecDiscription;
        this.startedDate = startedDate;
        this.toBeCompleted = toBeCompleted;
        this.completedDate = completedDate;
        this.completenessLevel = completenessLevel;
        this.priority = priority;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getOwner() {
        return owner;
    }

    public void setOwner(Long owner) {
        this.owner = owner;
    }

    public String getProjecName() {
        return projecName;
    }

    public void setProjecName(String projecName) {
        this.projecName = projecName;
    }

    public String getProjecDiscription() {
        return projecDiscription;
    }

    public void setProjecDiscription(String projecDiscription) {
        this.projecDiscription = projecDiscription;
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
