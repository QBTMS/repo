package controller;

import dao.UserDao;
import model.Project;
import model.User;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Created by prasad on 8/9/14.
 */
@Controller
public class ProjectController {

    private UserDao userDao;

    @Autowired
    private ProjectService projectService;

    @RequestMapping(value = "/add_project",method = RequestMethod.POST)
    public @ResponseBody
    String addProject(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Project project = new Project();
        int ownerId = userDao.getUserId();
        String startedDate = request.getParameter("projectStartedDate");
        String completedDate = request.getParameter("projectCompletedDate");
        Date stdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(startedDate);
        Date cmdate = new SimpleDateFormat("MMMM dd yyyy kk:mm:ss", Locale.ENGLISH).parse(completedDate);
        project.setOwner(Long.parseLong(String.valueOf(ownerId)));
        project.setProjecName(request.getParameter("projectName"));
        project.setProjecDiscription(request.getParameter("projectDescription"));
        project.setStartedDate(stdate);
        project.setCompletedDate(cmdate);

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
}
