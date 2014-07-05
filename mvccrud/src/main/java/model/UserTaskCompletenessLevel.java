package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by prasad on 6/8/14.
 */
@Entity
@Table(name = "userTaskCompletenessLevel")
public class UserTaskCompletenessLevel {

    @Column(name = "userTaskId")
    private long userTaskId;

    @Column(name = "completenessLevel", columnDefinition = "0")
    private int completenessLevel;

    public UserTaskCompletenessLevel() {
    }

    public UserTaskCompletenessLevel(long userTaskId, int completenessLevel) {
        this.userTaskId = userTaskId;
        this.completenessLevel = completenessLevel;
    }

    public long getUserTaskId() {
        return userTaskId;
    }

    public void setUserTaskId(long userTaskId) {
        this.userTaskId = userTaskId;
    }

    public int getCompletenessLevel() {
        return completenessLevel;
    }

    public void setCompletenessLevel(int completenessLevel) {
        this.completenessLevel = completenessLevel;
    }
}
