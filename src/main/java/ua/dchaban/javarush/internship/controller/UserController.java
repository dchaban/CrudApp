package ua.dchaban.javarush.internship.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ua.dchaban.javarush.internship.entity.User;
import ua.dchaban.javarush.internship.service.UserService;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getAllUser(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("users");
        List<User> users = userService.getAllUsers();
        PagedListHolder<User> pagedListHolder = new PagedListHolder<User>(users);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            page=1;
        }
        modelAndView.addObject("page", page);
        if(page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            modelAndView.addObject("users", pagedListHolder.getPageList());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public String updateList(@PathVariable("id") int id, Model model) {
        if (id == 0) {
            model.addAttribute("user", new User());
        }
        else {
            model.addAttribute("user", this.userService.getUserById(id));
        }
        return "update";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user) {
        if (user.getId() == 0) {
            this.userService.addUser(user);
        } else {
            this.userService.updateUser(user);
        }
        return "redirect:/";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        this.userService.removeUser(id);
        return "redirect:/";
    }

    @RequestMapping("userData/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userData";
    }

    @RequestMapping(value = "/admins", method = RequestMethod.GET)
    public String getAdmins(Model model) {
        model.addAttribute("users", this.userService.getAdmins());
        return "users";
    }

    @RequestMapping(value = "/searchUser", method = RequestMethod.GET)
    public String getAdmins(@RequestParam("searchName") String searchName, Model model) {
        model.addAttribute("users", this.userService.searchUsersByName(searchName));
        return "users";
    }
}
