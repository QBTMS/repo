package service;

import dao.VehicleDao;
import model.Employee;
import model.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by prasad on 4/25/14.
 */
@Service("vehicleService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    private VehicleDao vehicleDao;

    @Override
    @Transactional
    public void addVehicle(Vehicle vehicle) {
        vehicleDao.addVehicle(vehicle);
    }

    @Override
    public List<Vehicle> listVehicles() {
        return vehicleDao.listVehicles();
    }

    @Override
    public Vehicle getVehicle(String vehicleNumber) {
        return vehicleDao.getVehicle(vehicleNumber);
    }

    @Override
    public void deleteVehicle(Vehicle vehicle) {
        vehicleDao.deleteVehicle(vehicle);
    }

    @Override
    public void deleteVehicles(Employee employee){
        vehicleDao.deleteVehicles(employee);
    }
}
