package controller;

import dao.UserDao;
import model.CompletedProject;
import model.Project;
import model.User;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CompletedProjectService;
import service.ProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Created by prasad on 8/9/14.
 */
@Controller
public class ProjectController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private CompletedProjectService completedProjectService;

    Project project1 = new Project();
    CompletedProject completedProject = new CompletedProject();

    @RequestMapping(value = "/add-project",method = RequestMethod.POST)
    public @ResponseBody
    String addProject(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Project project = new Project();
        //int ownerId = userDao.getUserId();
        String startedDate = request.getParameter("startedDate");
        String toBeCompleted = request.getParameter("toBeCompleted");
        Date stdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(startedDate);
        Date cmdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(toBeCompleted);
       // project.setOwner(Long.parseLong(String.valueOf(ownerId)));
        project.setProjectName(request.getParameter("projectName"));
        project.setProjectDiscription(request.getParameter("projectDescription"));
        project.setStartedDate(stdate);
        project.setToBeCompleted(cmdate);

        projectService.addProject(project);
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(project);
    }

    /*@RequestMapping(value = "/add-task", method = RequestMethod.GET)
    public @ResponseBody
    String addUserTask(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        System.out.println("CCCCCCCCC");
        List<Project> myProjectList = projectService.listMyProject();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, myProjectList);

//        final byte[] data = out.toByteArray();
        System.out.println(out);
        return out.toString();
    }*/

    @RequestMapping(value = "/list-projects", method = RequestMethod.GET)
    public @ResponseBody
    String listProjects(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Project> projectList = projectService.listMyProject();
       // List<CompletedUserTask> completedUserTaskList = completedUserTaskService.listCompletedUserTask();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, projectList);

//        final byte[] data = out.toByteArray();
        System.out.println(out);
        return out.toString();
    }

    @RequestMapping(value = "/update-project", method = RequestMethod.GET)
    public String updateUserTask(@RequestParam("projectId") long projectId,
                                 @RequestParam("completenessLevel") int completenessLevel){
        projectService.update(projectId,completenessLevel);
        return "redirect:/my-task.html#groupProjects";
    }

    @RequestMapping(value = "/complete-project", method = RequestMethod.GET)
    public String completeUserTask(@RequestParam("projectId") long projectId) throws ParseException {

        //System.out.println("############################"+ userTask.getuserName());
        project1 = projectService.getProject(projectId);
        completedProject.setOwner(project1.getOwner());
        completedProject.setProjectName(project1.getProjectName());
        completedProject.setStartedDate(project1.getStartedDate());
        completedProject.setToBeCompleted(project1.getToBeCompleted());
        completedProject.setProjectDiscription(project1.getProjectDiscription());

        //DateFormat dateFormat;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
        Date now = new Date();
        String strDate = dateFormat.format(now);

        completedProject.setCompletedDate(dateFormat.parse(strDate));
        System.out.println("\n\n\n\n\n\ncalledController\n\n\n\n\n\n" + completedProject.getProjectName());

        completedProjectService.addCompletedProject(completedProject);
        projectService.deleteProject(project1);
        return "redirect:/my-task.html#groupProjects";
    }

    @RequestMapping(value = "/notcomplete-project", method = RequestMethod.GET)
    public String notComplete(@RequestParam("userTaskId") long userTaskId) throws ParseException {
        CompletedProject completedProject1 = new CompletedProject();
        Project project2 = new Project();
        //System.out.println("############################"+ userTask.getuserName());
        completedProject1 = completedProjectService.findById(userTaskId);
        project2.setOwner(completedProject1.getOwner());
        project2.setProjectName(completedProject1.getProjectName());
        project2.setStartedDate(completedProject1.getStartedDate());
        project2.setToBeCompleted(completedProject1.getToBeCompleted());
        project2.setProjectDiscription(completedProject1.getProjectDiscription());
        project2.setCompletenessLevel(completedProject1.getCompletenessLevel());


        projectService.addProject(project2);
        completedProjectService.deleteCompletedProject(completedProject1);
        return "redirect:/my-task.html#groupProjects";
    }

    @RequestMapping(value = "/completed-project", method = RequestMethod.GET)
    public @ResponseBody
    String listCompletedProject(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<CompletedProject> completedProjects = completedProjectService.listMyCompletedProject();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, completedProjects);

//        final byte[] data = out.toByteArray();
        System.out.println(out);
        return out.toString();
    }

    @RequestMapping(value = "/delete-completed-project", method = RequestMethod.GET)
    public String deleteCompletedProject(@RequestParam("projectId") long projectId) throws ParseException {
        CompletedProject completedProject1 = new CompletedProject();
        completedProject1 = completedProjectService.findById(projectId);
        completedProjectService.deleteCompletedProject(completedProject1);
        return "redirect:/my-task.html#groupProjects";
    }

}
