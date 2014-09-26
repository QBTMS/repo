package controller;

import model.*;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.PortResolverImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Created by prasad on 9/17/14.
 */
@Controller
public class ProjectTaskController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CompletedProjectService completedProjectService;

    @Autowired
    private ProjectTasksService projectTasksService;

    @Autowired
    private CompletedProjectTaskService completedProjectTaskService;

    @RequestMapping(value = "/list-project-names", method = RequestMethod.GET)
    public @ResponseBody
    String listProjectNames(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Project> projectList;
        projectList = projectService.listMyProjectNames();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, projectList);

//        final byte[] data = out.toByteArray();
        System.out.println("@@@@@@@@@@@@@"+out);
        return out.toString();
    }

    @RequestMapping(value = "/list-user-names", method = RequestMethod.GET)
    public @ResponseBody
    String listUserNames(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Users> users;
        users = usersService.listAllUserNames();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, users);

//        final byte[] data = out.toByteArray();
        System.out.println("@@@@@@@@@@@@@"+out);
        return out.toString();
    }

    @RequestMapping(value = "/list-project-tasks", method = RequestMethod.GET)
    public @ResponseBody
    String listProjects(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<ProjectTasks> projectTasksList = projectTasksService.listMyProjectTasks();
        // List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, projectTasksList);

//        final byte[] data = out.toByteArray();
        System.out.println("\n\n\n===================="+out+"=================\n\n\n");
        return out.toString();
    }

    @RequestMapping(value = "/list-completed-project-tasks", method = RequestMethod.GET)
    public @ResponseBody
    String listCompletedProjects(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<CompletedProjectTask> completedProjectTasks = completedProjectTaskService.listMyProjectTasks();
        // List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, completedProjectTasks);

//        final byte[] data = out.toByteArray();
        System.out.println("\n\n\n===================="+out+"=================\n\n\n");
        return out.toString();
    }

    @RequestMapping(value = "/add-project-task", method = RequestMethod.POST)
    public @ResponseBody
    String addProjectTask(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
ProjectTasks projectTasks = new ProjectTasks();

         String project_id = request.getParameter("project_id");
         String asignee = request.getParameter("asignee");
         String projectTaskName = request.getParameter("projectTaskName");
         String projectTaskDiscription = request.getParameter("projectTaskDiscription");
         String startedDate = request.getParameter("startedDate");
         String toBeCompleted = request.getParameter("toBeCompleted");

        Date stdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(startedDate);
        Date cmdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(toBeCompleted);

        projectTasks.setProject_id(Long.valueOf(project_id));
        projectTasks.setAsignee(Integer.parseInt(asignee));
        projectTasks.setProjectTaskName(projectTaskName);
        projectTasks.setProjectTaskDiscription(projectTaskDiscription);
        projectTasks.setStartedDate(stdate);
        projectTasks.setToBeCompleted(cmdate);
        projectTasks.setCompletenessLevel(0);
        projectTasks.setPriority(0);

        projectTasksService.addProjectTask(projectTasks);

        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(projectTasks);
//        return employee;
//        return "redirect:/my-task.html";
    }

    @RequestMapping(value = "/update-project-task", method = RequestMethod.GET)
    public String updateProjectTask(@RequestParam("projectTaskId") long projectTaskId,
                                 @RequestParam("completenessLevel") int completenessLevel){
        projectTasksService.update(projectTaskId,completenessLevel);
        return "redirect:/my-task.html#groupTasks";
    }

    @RequestMapping(value = "/complete-project-task", method = RequestMethod.GET)
    public String completeProjectTask(@RequestParam("projectTaskId") long projectTaskId) throws ParseException {
        ProjectTasks projectTasks;
        CompletedProjectTask completedProjectTask = new CompletedProjectTask();
        projectTasks = projectTasksService.getProjectTask(projectTaskId);
        completedProjectTask.setProject_id(projectTasks.getProject_id());
        completedProjectTask.setAsignee(projectTasks.getAsignee());
        completedProjectTask.setProjectTaskName(projectTasks.getProjectTaskName());
        completedProjectTask.setProjectTaskDiscription(projectTasks.getProjectTaskDiscription());
        completedProjectTask.setStartedDate(projectTasks.getStartedDate());
        completedProjectTask.setToBeCompleted(projectTasks.getToBeCompleted());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
        Date now = new Date();
        String strDate = dateFormat.format(now);
        completedProjectTask.setCompletedDate(dateFormat.parse(strDate));

        completedProjectTaskService.addProjectTask(completedProjectTask);
        projectTasksService.deleteProjectTask(projectTasks);
        return "redirect:/my-task.html#groupTasks";
    }

    @RequestMapping(value = "/notcomplete-project-task", method = RequestMethod.GET)
    public String notComplete(@RequestParam("projectTaskId") long projectTaskId) throws ParseException {
        CompletedProjectTask completedProjectTask;
        ProjectTasks projectTasks = new ProjectTasks();
        completedProjectTask = completedProjectTaskService.findProjectTaskById(projectTaskId);
        projectTasks.setProject_id(completedProjectTask.getProject_id());
        projectTasks.setAsignee(completedProjectTask.getAsignee());
        projectTasks.setProjectTaskName(completedProjectTask.getProjectTaskName());
        projectTasks.setProjectTaskDiscription(completedProjectTask.getProjectTaskDiscription());
        projectTasks.setStartedDate(completedProjectTask.getStartedDate());
        projectTasks.setToBeCompleted(completedProjectTask.getToBeCompleted());

        projectTasksService.addProjectTask(projectTasks);
        completedProjectTaskService.deleteProjectTask(completedProjectTask);
        return "redirect:/my-task.html#groupTasks";
    }

    @RequestMapping(value = "/completed-project-tasks", method = RequestMethod.GET)
    public @ResponseBody
    String listCompletedProjectTasks(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<CompletedProjectTask> completedProjectTasks = completedProjectTaskService.listMyProjectTasks();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, completedProjectTasks);

//        final byte[] data = out.toByteArray();
        System.out.println(out);
        return out.toString();
    }

    @RequestMapping(value = "/all-completed-project-tasks", method = RequestMethod.GET)
    public @ResponseBody
    String listAllCompletedProjectTasks(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<CompletedProjectTask> completedProjectTasks = completedProjectTaskService.allCompletedProjectTasks();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, completedProjectTasks);

//        final byte[] data = out.toByteArray();
        System.out.println("\n\nCCCCCCCCCCCCCCCCCCCCCCC"+out);
        return out.toString();
    }

    @RequestMapping(value = "/delete-completed-project-task", method = RequestMethod.GET)
    public String deleteCompletedProject(@RequestParam("projectTaskId") long projectTaskId) throws ParseException {
        CompletedProjectTask completedProjectTask;
        completedProjectTask = completedProjectTaskService.findProjectTaskById(projectTaskId);
        completedProjectTaskService.deleteProjectTask(completedProjectTask);
        return "redirect:/my-task.html#groupTasks";
    }

    @RequestMapping(value = "/list-asigned-project-tasks", method = RequestMethod.GET)
    public @ResponseBody
    String listAsignedProjects(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<ProjectTasks> projectTasksList = projectTasksService.listAsignedProjectTasks();
        // List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, projectTasksList);

//        final byte[] data = out.toByteArray();
        System.out.println("\n\n\nAsigned===================="+out+"=================\n\n\n");
        return out.toString();
    }

    @RequestMapping(value = "/project-count", method = RequestMethod.GET)
    public @ResponseBody
    String getProjectCounts(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
         int projectsCreated = projectService.projectCount();
         int projectsCompleted = completedProjectService.completedProjectCount();
         int groupTasksCreated = projectTasksService.taskCreatedCount();
         int groupTasksReceived = projectTasksService.taskReceivedCount();
         int groupTasksCompleted = completedProjectTaskService.taskCompletedCount();

        ProjectCounts projectCounts = new ProjectCounts();

        projectCounts.setProjectsCreated(projectsCreated);
        projectCounts.setProjectsCompleted(projectsCompleted);
        projectCounts.setGroupTasksCreated(groupTasksCreated);
        projectCounts.setGroupTasksCompleted(groupTasksCompleted);
        projectCounts.setGroupTasksReceived(groupTasksReceived);

        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, projectCounts);

//        final byte[] data = out.toByteArray();
        System.out.println("\n\n\nProject Counts==============="+out);
        return out.toString();
    }
}
