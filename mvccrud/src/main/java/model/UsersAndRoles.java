package model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by prasad on 9/5/14.
 */
@Entity
@Table(name = "usersandroles")
public class UsersAndRoles implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "user_id")
    private int user_id;

    @Column(name = "role_id")
    private int role_id;

    public UsersAndRoles(){}

    public UsersAndRoles(int user_id, int role_id) {
        this.user_id = user_id;
        this.role_id = role_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
