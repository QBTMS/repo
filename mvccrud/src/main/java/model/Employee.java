package model;

import org.hibernate.validator.constraints.Range;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by prasad on 4/24/14.
 */
@Entity
@Table(name="Employee")
public class Employee implements Serializable {

    private static final long serialVersionUID = -723583058586873479L;


    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "EMPID")
    private Integer empId;


    @Size(min = 1, max = 10)
    @Pattern(regexp ="^[A-Z]{1}[a-z]{0,9}$", message = "FIrst latter of the name should be capital and rests are simple")
    @Column(name="EMPNAME")
    private String empName;

    @Size(min = 1, max = 100)
    @Column(name="ADDRESS")
    private String empAddress;

    @NotNull
    @Min(1000)
    @Max(100000)
    @Column(name="SALARY")
    private Long salary;

    @NotNull
    @Range(min = 18, max = 60)
    @Column(name="AGE")
    private Integer empAge;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "employee")
    private List<Vehicle> vehicleList = new ArrayList<Vehicle>();

    public Employee() {
    }

    public Employee(Integer empId, String empName, String empAddress, Long salary, Integer empAge) {
        this.empId = empId;
        this.empName = empName;
        this.empAddress = empAddress;
        this.salary = salary;
        this.empAge = empAge;
    }


    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }


    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }


    public String getEmpAddress() {
        return empAddress;
    }

    public void setEmpAddress(String empAddress) {
        this.empAddress = empAddress;
    }


    public Long getSalary() {
        return salary;
    }

    public void setSalary(Long salary) {
        this.salary = salary;
    }


    public Integer getEmpAge() {
        return empAge;
    }

    public void setEmpAge(Integer empAge) {
        this.empAge = empAge;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public List<Vehicle> getVehicleList() {
        return vehicleList;
    }

    public void setVehicleList(List<Vehicle> vehicleList) {
        this.vehicleList = vehicleList;
    }
}
