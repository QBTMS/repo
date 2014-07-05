package dao;

import model.Employee;

import java.util.List;

/**
 * Created by prasad on 4/24/14.
 */
public interface EmployeeDao {
    public void addEmployee(Employee employee);

    public List<Employee> listEmployeess();

    public Employee getEmployee(int empid);

    public void deleteEmployee(Employee employee);

    public Employee findById(Integer id);
}
