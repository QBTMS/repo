package model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "Vehicle")
public class Vehicle{

   // @NotNull
    @Id
    @Column(name = "VNUMBER")
    private String vehicleNumber;


  // @Size(min = 1, max = 10)
    @Column(name = "VTYPE")
    private String vehicleType;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "employee_EMPID", nullable = false)
    private Employee employee;

    public Vehicle() {
    }

    public Vehicle(String vehicleNumber, String vehicleType, Employee employee) {
        this.vehicleNumber = vehicleNumber;
        this.vehicleType = vehicleType;
        this.employee = employee;
    }


    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }


    public String getVehicleType() {
        return vehicleType;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    //@Column(name = "OWNER")

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}