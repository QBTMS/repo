package service.impl;

import dao.EmployeeDao;
import model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.EmployeeService;

import java.util.List;

/**
 * Created by prasad on 4/24/14.
 */
@Service("employeeService")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addEmployee(Employee employee) {
        employeeDao.addEmployee(employee);
    }

    public List<Employee> listEmployeess() {
        return employeeDao.listEmployeess();
    }

    public Employee getEmployee(int empid) {
        return employeeDao.getEmployee(empid);
    }

    public void deleteEmployee(Employee employee) {
        employeeDao.deleteEmployee(employee);
    }

    public Employee findById(Integer id){
        Employee employee = employeeDao.findById(id);
        return employee;
    }
}
