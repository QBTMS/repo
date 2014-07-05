package model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by prasad on 6/4/14.
 */
@Entity
@Table(name = "userTask")
public class UserTask implements Serializable{

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "userTaskId")
    private Long userTaskId;

    @Column(name = "userName")
    private String userName;

    @Column(name = "userTaskName")
    private String userTaskName;

    @Column(name = "userTaskDiscription")
    private String userTaskDiscription;

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

    public UserTask(){}

    public UserTask(Date completedDate, String userName, String userTaskName, String userTaskDiscription, Date startedDate, Date toBeCompleted, int completenessLevel) {
        this.completedDate = completedDate;
        this.userName = userName;
        this.userTaskName = userTaskName;
        this.userTaskDiscription = userTaskDiscription;
        this.startedDate = startedDate;
        this.toBeCompleted = toBeCompleted;
        this.completenessLevel = completenessLevel;
    }

    public Long getUserTaskId() {
        return userTaskId;
    }

    public void setUserTaskId(Long userTaskId) {
        this.userTaskId = userTaskId;
    }

    public String getuserName() {
        return userName;
    }

    public void setuserName(String userName) {
        this.userName = userName;
    }

    public String getUserTaskName() {
        return userTaskName;
    }

    public void setUserTaskName(String userTaskName) {
        this.userTaskName = userTaskName;
    }

    public String getUserTaskDiscription() {
        return userTaskDiscription;
    }

    public void setUserTaskDiscription(String userTaskDiscription) {
        this.userTaskDiscription = userTaskDiscription;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getCompletenessLevel() {
        return completenessLevel;
    }

    public void setCompletenessLevel(int completenessLevel) {
        this.completenessLevel = completenessLevel;
    }
}
