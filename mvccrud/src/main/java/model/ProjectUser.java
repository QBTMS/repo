package model;

import javax.persistence.*;

/**
 * Created by prasad on 8/7/14.
 */
@Entity
@Table(name = "projectUser")
public class ProjectUser {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "projectUserId")
    private Long projectUserId;

    @Column(name = "project_id")
    private Long project_id;

    @Column(name = "asignee")
    private Long asignee;

    public ProjectUser(Long projectUserId, Long project_id, Long asignee) {
        this.projectUserId = projectUserId;
        this.project_id = project_id;
        this.asignee = asignee;
    }

    public Long getProject_id() {
        return project_id;
    }

    public void setProject_id(Long project_id) {
        this.project_id = project_id;
    }

    public Long getAsignee() {
        return asignee;
    }

    public void setAsignee(Long asignee) {
        this.asignee = asignee;
    }

    public Long getProjectUserId() {
        return projectUserId;
    }

    public void setProjectUserId(Long projectUserId) {
        this.projectUserId = projectUserId;
    }
}
