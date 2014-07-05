package dao;

import model.Employee;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by prasad on 4/24/14.
 */
@Repository("employeeDao")
public class EmployeeDaoImpl implements EmployeeDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void addEmployee(Employee employee) {
        sessionFactory.getCurrentSession().saveOrUpdate(employee);
    }

    //("unchecked")
    public List<Employee> listEmployeess() {
        return (List<Employee>) sessionFactory.getCurrentSession().createQuery("from model.Employee").list();
    }

    public Employee getEmployee(int empid) {
        return (Employee) sessionFactory.getCurrentSession().get(Employee.class, empid);
    }

    public void deleteEmployee(Employee employee) {
        String hql = "DELETE FROM model.Employee WHERE EMPID = :empId";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter("empId", employee.getEmpId());
        query.executeUpdate();
    }

    public Employee findById(Integer id) {

            String hql = "from Employee where empId = :id";
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            query.setParameter("id", id);
            Employee employee =  (Employee) query.uniqueResult();

            return employee;

    }
}