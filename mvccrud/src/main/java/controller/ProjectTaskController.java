package controller;

import model.Project;
import model.ProjectTasks;
import model.Users;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.PortResolverImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CompletedProjectService;
import service.ProjectService;
import service.ProjectTasksService;
import service.UsersService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
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
}
