package controller;

import model.CompletedUserTask;
import model.Person;
import model.User;
import model.UserTask;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.SessionFactory;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.CompletedUserTaskService;
import service.UserTaskService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by prasad on 6/4/14.
 */
@Controller
public class UserTaskController {

    @Autowired
    private UserTaskService userTaskService;

    @Autowired
    private CompletedUserTaskService completedUserTaskService;

    CompletedUserTask completedUserTask = new CompletedUserTask();
    UserTask userTask1 = new UserTask();

    private SessionFactory sessionFactory;

//    @RequestMapping(value = "/", method = RequestMethod.GET)
//    public String index(){
//        System.out.println("AAAAAAA");
//        return "redirect:/my-task";
//    }


    @RequestMapping(value = "/my-task", method = RequestMethod.GET)
    public String myTask(){
        System.out.println("AAAAAAA");
        return "my-tasks";
    }
    @RequestMapping(value = "/addtask",method = RequestMethod.POST)
    public @ResponseBody
    String add(HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        UserTask employee = new UserTask();

        String userTaskName = request.getParameter("userTaskName");
        String userTaskDescription = request.getParameter("userTaskDescription");
        String startedDate = request.getParameter("startedDate");
        String toBeCompleted = request.getParameter("toBeCompleted");

        Date stdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(startedDate);
        Date cmdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(toBeCompleted);

        employee.setUserTaskName(userTaskName);
        employee.setUserTaskDiscription(userTaskDescription);
        employee.setStartedDate(stdate);
        employee.setToBeCompleted(cmdate);
        Authentication authentication = SecurityContextHolder.getContext().
                getAuthentication();
        String name = authentication.getName();
        employee.setUserName(name);
        userTaskService.addUserTask(employee);

        System.out.println(employee.getUserTaskName());
        System.out.println(employee.getUserTaskDiscription());
//        System.out.println(employee.getLastName());

//        return "redirect:/add-task.html";
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(employee);
//        return employee;
    }

    @RequestMapping(value = "/add-task", method = RequestMethod.GET)
    public @ResponseBody
    String addUserTask(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        System.out.println("CCCCCCCCC");
        List<UserTask> myTaskList = userTaskService.listUserTask();
        List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
         OutputStream out = new ByteArrayOutputStream();
         ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, myTaskList);

//        final byte[] data = out.toByteArray();
        System.out.println(out);
        return out.toString();
    }

//    @RequestMapping(value = "/add-task", method = RequestMethod.GET)
//    public String addUserTask(@ModelAttribute("addUserTaskCommand") UserTask userTask, ModelMap modelMap){
//        System.out.println("CCCCCCCCC");
//        List<UserTask> myTaskList = userTaskService.listUserTask();
//        List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
//        modelMap.addAttribute("myTaskList", myTaskList);
//        modelMap.addAttribute("completedTaskList", completedUserTaskList);
//        System.out.println("CCCCCCCCC");
//        return "my-tasks";
//    }

    @RequestMapping(value = "/addtasask", method = RequestMethod.POST)
    public @ResponseBody
    String add1(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        System.out.println("BBBBBBBBB");
//        Person employee = new Person();
Person employee = new Person();

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String email = request.getParameter("startedDate");

        employee.setEmail(email);
        employee.setFirstName(firstName);
        employee.setLastName(lastName);

        System.out.println(employee.getEmail());
        System.out.println(employee.getFirstName());
        System.out.println(employee.getLastName());
        System.out.println("BBBBBBBBB");

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(employee);
//        return employee;
//        return "redirect:/my-task.html";
    }


    @RequestMapping(value = "/saveUserTask", method = RequestMethod.POST)
    public String saveUserTask(@ModelAttribute("addUserTaskCommand") UserTask userTask) {
        Authentication authentication = SecurityContextHolder.getContext().
        	                getAuthentication();
        	        String name = authentication.getName();
                    userTask.setUserName(name);
        userTaskService.addUserTask(userTask);
        return "redirect:/add-task.html";
    }

    @RequestMapping(value = "/edit-task", method = RequestMethod.GET)
    public ModelAndView editUserTask(@ModelAttribute("command")UserTask userTask) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("editTask" , userTaskService.getUserTask(userTask.getUserTaskId()));
        return new ModelAndView("my-tasks", model);
    }

    @RequestMapping(value = "/delete-task", method = RequestMethod.GET)
    public String deleteUserTask(@ModelAttribute("command")UserTask userTask) {
        userTaskService.deleteUserTask(userTask);
        return "redirect:/add-task.html";
    }

    @RequestMapping(value = "/update-task", method = RequestMethod.GET)
    public String updateUserTask(@RequestParam("userTaskId") long userTaskId,
                                @RequestParam("completenessLevel") int completenessLevel){
        userTaskService.update(userTaskId,completenessLevel);
        return "redirect:/my-task.html";
    }

    @RequestMapping(value = "/complete-task", method = RequestMethod.GET)
    public String completeUserTask(@RequestParam("userTaskId") long userTaskId) throws ParseException {

        //System.out.println("############################"+ userTask.getuserName());
        userTask1 = userTaskService.getUserTask(userTaskId);
        completedUserTask.setUserName(userTask1.getUserName());
        completedUserTask.setUserTaskName(userTask1.getUserTaskName());
        completedUserTask.setStartedDate(userTask1.getStartedDate());
        completedUserTask.setToBeCompleted(userTask1.getToBeCompleted());
        completedUserTask.setUserTaskDiscription(userTask1.getUserTaskDiscription());
        completedUserTask.setCompletenessLevel(100);

        //DateFormat dateFormat;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
        Date now = new Date();
        String strDate = dateFormat.format(now);

        completedUserTask.setCompletedDate(dateFormat.parse(strDate));
        System.out.println("\n\n\n\n\n\ncalledController\n\n\n\n\n\n" + completedUserTask.getUserTaskName());

        completedUserTaskService.addCompletedUserTask(completedUserTask);
        userTaskService.deleteUserTask(userTask1);
        return "redirect:/my-task.html";
    }

    @RequestMapping(value = "/completed-task", method = RequestMethod.GET)
    public @ResponseBody
    String listCompletedTask(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, completedUserTaskList);

//        final byte[] data = out.toByteArray();
        System.out.println(out);
        return out.toString();
    }
}
