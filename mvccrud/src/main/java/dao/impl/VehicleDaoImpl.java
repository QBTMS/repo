package dao.impl;

import dao.VehicleDao;
import model.Employee;
import model.Vehicle;
import org.hibernate.SessionFactory;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Queue;

/**
 * Created by prasad on 4/25/14.
 */
@Repository("vehicleDao")
public class VehicleDaoImpl implements VehicleDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void addVehicle(Vehicle vehicle) {
        sessionFactory.getCurrentSession().saveOrUpdate(vehicle);
    }

    @Override
    public List<Vehicle> listVehicles() {
        return (List<Vehicle>) sessionFactory.getCurrentSession().createQuery("from model.Vehicle").list();
    }

    @Override
    public Vehicle getVehicle(String vehicleNumber) {
        return (Vehicle) sessionFactory.getCurrentSession().get(Vehicle.class, vehicleNumber);
    }

    @Override
    public void deleteVehicles(Employee employee){
        String hql = "DELETE FROM model.Vehicle WHERE employee = :employee";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("employee", employee);
        query.executeUpdate();
    }

    @Override
    public void deleteVehicle(Vehicle vehicle) {
        String hql = "DELETE FROM model.Vehicle WHERE VNUMBER = :vehicleNumber";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("vehicleNumber", vehicle.getVehicleNumber());
        query.executeUpdate();
     }
}
