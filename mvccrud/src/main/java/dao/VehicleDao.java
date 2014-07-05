package dao;

import model.Employee;
import model.Vehicle;

import java.util.List;

/**
 * Created by prasad on 4/25/14.
 */
public interface VehicleDao {
    public void addVehicle(Vehicle vehicle);

    public List<Vehicle> listVehicles();

    public Vehicle getVehicle(String vehicleNumber);

    public void deleteVehicle(Vehicle vehicle);

    public void deleteVehicles(Employee employee);
}
