package controller;

import model.CompletedUserTask;
import model.User;
import model.UserTask;
import org.hibernate.SessionFactory;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.CompletedUserTaskService;
import service.UserTaskService;

import javax.validation.Valid;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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


    @RequestMapping(value = "/my-task", method = RequestMethod.GET)
    public String myTask(){

        return "my-tasks";
    }

    @RequestMapping(value = "/add-task", method = RequestMethod.GET)
    public String addUserTask(@ModelAttribute("addUserTaskCommand") UserTask userTask, ModelMap modelMap){
        List<UserTask> myTaskList = userTaskService.listUserTask();
        List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
        modelMap.addAttribute("myTaskList", myTaskList);
        modelMap.addAttribute("completedTaskList", completedUserTaskList);

        return "my-tasks";
    }

    @RequestMapping(value = "/saveUserTask", method = RequestMethod.POST)
    public String saveUserTask(@ModelAttribute("addUserTaskCommand") UserTask userTask) {
        Authentication authentication = SecurityContextHolder.getContext().
        	                getAuthentication();
        	        String name = authentication.getName();
                    userTask.setuserName(name);
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
        return "redirect:/add-task.html";
    }

    @RequestMapping(value = "/complete-task", method = RequestMethod.GET)
    public String completeUserTask(@RequestParam("userTaskId") long userTaskId) throws ParseException {

        //System.out.println("############################"+ userTask.getuserName());
        userTask1 = userTaskService.getUserTask(userTaskId);
        completedUserTask.setuserName(userTask1.getUserName());
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
        return "redirect:/add-task.html";
    }
}
