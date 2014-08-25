package controller;

import dao.UserDao;
import model.Role;
import model.User;
import model.UserStatus;
import model.Users;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.UserDetailsServiceImpl;
import service.UserService;

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
        List<Users> usersList = userService.getAllUsers();
        OutputStream out = new ByteArrayOutputStream();
        ObjectMapper mapper = new ObjectMapper();

//        System.out.println(mapper.writeValueAsString(myTaskList.toString()));
//        return mapper.writeValueAsString(myTaskList.toString());
        mapper.writeValue(out, usersList);

//        final byte[] data = out.toByteArray();
        System.out.println("=========================================="+out.toString());
        return out.toString();
    }

}

