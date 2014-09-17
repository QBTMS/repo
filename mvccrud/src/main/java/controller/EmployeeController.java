package controller;

//import bean.EmployeeBean;
import model.Employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.EmployeeService;
import service.VehicleService;

import javax.validation.Valid;


/**
 * Created by prasad on 4/24/14.
 */
@Controller
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private VehicleService vehicleService;




    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String saveEmployee(@Valid @ModelAttribute("command") Employee employee, BindingResult result) {
        System.out.println("Has errorssssss" + result.hasErrors());
        if(result.hasErrors()){
            System.out.println("Has errorssssss");
            return "addEmployee";
        }
        employeeService.addEmployee(employee);
            return "redirect:/employees.html";
       /* }catch (Exception e){
            System.out.println("*****************************Exception***************************************" + e );
            return new ModelAndView("errorView");
        }*/
    }

    @RequestMapping(value = "/saveVehicle", method = RequestMethod.POST)
    public String saveVehicle( /*@RequestParam("vehicleNumber") String vehicleNumber,
                                    @RequestParam("vehicleType") String vehicleType,
                                    @RequestParam("employee") int employee*/
                                    @Valid Vehicle commandVehicle ,BindingResult result) {
        /*if(result.hasErrors()){
            System.out.println("\n\nHas errors\n\n" + result.hasErrors() + "\n\n\n" + result.getAllErrors() + "\n\n\n");
            return"redirect:/addVehicle.html";
        }*/
//        System.out.println("\n\nHas errors\n\n" + result.hasErrors());
//        System.out.println("\n\n"+result.getAllErrors()+"\n\n");
        Employee employee = commandVehicle.getEmployee();
        System.out.println("\n\n\nemployee = "+employee+"\n\n\n");
//        String vehicleNumber = commandVehicle.getVehicleNumber();
//        System.out.println("\n\n\nvehicleNumber = "+vehicleNumber+"\n\n\n");
        String vehicleType = commandVehicle.getVehicleType();
        System.out.println("\n\n\nvehicleType = "+vehicleType+"\n\n\n");
       // Vehicle vehicle = new Vehicle(vehicleNumber,vehicleType,employeeService.findById(employee));

        vehicleService.addVehicle(commandVehicle);
        return "redirect:/add.html";
    }






   /* @RequestMapping(value = "/saveVehicle", method = RequestMethod.POST)
    public String saveVehicle(@ModelAttribute("commandVehicle") Vehicle v) {
//        if(result.hasErrors()){
//            System.out.println("\n\nHas errors\n\n" + result.hasErrors());
//            return"redirect:/addVehicle.html";
//        }
       // System.out.println("\n\nHas errors\n\n" + result.hasErrors());

        //System.out.println("\n\n"+result.getAllErrors()+"\n\n");

       // v.setEmployee(employeeService.findById(employee));

//        Vehicle vehicle = new Vehicle(v.getVehicleNumber(),v.getVehicleType(),employeeService.findById(employee));
        vehicleService.addVehicle(v);
        return "redirect:/add.html";
    }*/

    /*@RequestMapping(value="/employees", method = RequestMethod.GET)
    public ModelAndView listEmployees() {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("employees",  employeeService.listEmployeess());
        return new ModelAndView("employeeList", model);
    }*/

    @RequestMapping(value="/employees", method = RequestMethod.GET)
    public String listEmployees(ModelMap model) {
        List<Employee> empList = employeeService.listEmployeess();
        List<Vehicle> vehicleList = vehicleService.listVehicles();
        model.addAttribute("employees", empList);
        model.addAttribute("vehicles", vehicleList);
        return "employeeList";

    }

    /*@RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addEmployee(@ModelAttribute("command")Employee employee, @ModelAttribute("commandVehicle") Vehicle vehicle,
                                    BindingResult result) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("employees",employeeService.listEmployeess());
        model.put("vehicles",vehicleService.listVehicles());
        return new ModelAndView("addEmployee", model);
    }*/

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addEmployee(ModelMap model, @ModelAttribute("command")Employee employee, @ModelAttribute("commandVehicle") Vehicle vehicle,
                                    BindingResult result) {
        List<Employee> empList = employeeService.listEmployeess();
        List<Vehicle> vehicleList = vehicleService.listVehicles();
        model.addAttribute("employees", empList);
        model.addAttribute("vehicles", vehicleList);
        return "addEmployee";
    }

    @RequestMapping(value = "/addVehicle", method = RequestMethod.GET)
    public String addVehicle(ModelMap model, @ModelAttribute("command")Employee employee, @ModelAttribute("commandVehicle") Vehicle vehicle,
                              BindingResult result) {
        List<Employee> empList = employeeService.listEmployeess();
        List<Vehicle> vehicleList = vehicleService.listVehicles();
        model.addAttribute("employees", empList);
        model.addAttribute("vehicles", vehicleList);
        return "addVehicle";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView welcome() {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String editEmployee(ModelMap model, @ModelAttribute("command")Employee employee, @ModelAttribute("commandVehicle") Vehicle vehicle,
                                     BindingResult result) {
        vehicleService.deleteVehicles(employee);
        employeeService.deleteEmployee(employee);

        List<Employee> empList = employeeService.listEmployeess();
        List<Vehicle> vehicleList = vehicleService.listVehicles();
        model.addAttribute("employees", empList);
        model.addAttribute("vehicles", vehicleList);
        return "addEmployee";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView deleteEmployee(@ModelAttribute("command")Employee employee,
                                       BindingResult result) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("employee",employeeService.getEmployee(employee.getEmpId()));
        model.put("employees",  employeeService.listEmployeess());
        model.put("vehicles", vehicleService.listVehicles());
        return new ModelAndView("addEmployee", model);
    }


    @RequestMapping(value = "/deleteV", method = RequestMethod.GET)
    public String editVehicle(ModelMap model, @ModelAttribute("command")Employee employee, @ModelAttribute("commandVehicle") Vehicle vehicle,
                                     BindingResult result) {
        vehicleService.deleteVehicle(vehicle);
        List<Employee> empList = employeeService.listEmployeess();
        List<Vehicle> vehicleList = vehicleService.listVehicles();
        model.addAttribute("employees", empList);
        model.addAttribute("vehicles", vehicleList);
        return "addEmployee";
    }

    @RequestMapping(value = "/editV", method = RequestMethod.GET)
    public ModelAndView deleteVehicle(@ModelAttribute("command")Employee employee, @ModelAttribute("commandVehicle") Vehicle vehicle,
                                       BindingResult result) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("vehicle",vehicleService.getVehicle(vehicle.getVehicleNumber()));
        model.put("vehicles",  vehicleService.listVehicles());
        return new ModelAndView("addVehicle", model);
    }
}
