package controller;

import dao.UserDao;
import model.*;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.UserService;
import service.UsersAndRolesService;
import service.UsersService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.List;

/**
 * Created by prasad on 6/8/14.
 */
@Controller
public class UserController {

    @Autowired
    private UserDao userDao;


    @Autowired
    private UserService userService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private UsersAndRolesService usersAndRolesService;


    User user = new User();

    @RequestMapping(value = "/add-user", method = RequestMethod.GET)
    public String addUser(@RequestParam("userName") String userName,
                        @RequestParam("password") String password){

        user.setUsername(userName);
        user.setPassword(password);
        user.setStatus(UserStatus.ACTIVE);

        if(userDao.addUser(user)){
            return "redirect:/add-task.html";
        }else
            return "redirect:/index.html";


    }


    @RequestMapping(value = "/list-users", method = RequestMethod.GET)
    public String listAllUsers(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<Users> usersList = usersService.listAllUserNames();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, usersList);

//        final byte[] data = out.toByteArray();
        System.out.println("\n\n=========================================="+out.toString()+"\n\n");
        return out.toString();
    }

    @RequestMapping(value = "/create-account", method = RequestMethod.POST)
    public String createAccount(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("\n\n=========================================="+name+"-"+email+"-"+password+"\n\n");
        Users users = new Users();
        users.setName(name);
        users.setUsername(email);
        users.setPassword(password);
        users.setStatus("ACTIVE");
        usersService.addusres(users);
        List<Users> usersList = usersService.getUsers(email);
        System.out.println("\n\n=========================================="+usersList.get(0).getName()+"-"+usersList.get(0).getUsername()+"-"+usersList.get(0).getPassword()+"-"+usersList.get(0).getId()+"\n\n");
        UsersAndRoles usersAndRoles = new UsersAndRoles();
        usersAndRoles.setRole_id(1);
        usersAndRoles.setUser_id(usersList.get(0).getId());
//        usersAndRoles.setId(usersList.get(0).getId());
        usersAndRolesService.addRoles(usersAndRoles);
        return "redirect:/my-task.html";
    }


}

