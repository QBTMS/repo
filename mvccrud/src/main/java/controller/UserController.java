package controller;

import dao.UserDao;
import model.Role;
import model.User;
import model.UserStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.UserDetailsServiceImpl;

/**
 * Created by prasad on 6/8/14.
 */
@Controller
public class UserController {

    @Autowired
    private UserDao userDao;


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
}

