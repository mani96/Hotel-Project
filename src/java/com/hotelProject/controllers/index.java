package com.hotelProject.controllers;


import dao.UserManager;
import datasource.Datasource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import wrappers.Authenticate;
import wrappers.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author manvir
 */
@Controller
@SessionAttributes({"user"})
public class index {
   
    /**
     * This method constructs the index.jsp page and passes on the information required by the manvir
     * Some information requested is:
     * Hotel Room Descriptions(room.description) field from the database
     * @param mv
     * @return 
     */
    @RequestMapping(value = {"home","index"})
    public ModelAndView HomePage(ModelAndView mv){
        mv = new ModelAndView("index");
        // add data to use on index page
        /**
         * 
         * To use please use Model and View or sessions
         * for Model and view: 
         * mv.addObject("ATTRIBUTE_NAME","VALUE");
         * 
         */
        return mv;
    }
    
    @RequestMapping(value = {"authenticate","login"}, method = RequestMethod.POST)
    public ModelAndView loginUser(@ModelAttribute("Authenticate") Authenticate auth,@ModelAttribute("user") User sessionUser)
    {
        ModelAndView mv = null;
        if(auth.username.isEmpty() || auth.password.isEmpty())
        {
            // empty username and password redirect to login page again!
            mv = new ModelAndView("index");
            mv.addObject("status","FAILED");
            mv.addObject("reason","Empty username or password!");
        }
        else
        {
            try {
                // ready to process
                UserManager usm = new UserManager(Datasource.getDatasource());
                boolean authenticated = usm.authenticate(auth);
                if(authenticated)
                {
                    User user = usm.get(auth.username);
                    if(user.isAdmin())
                    {
                        // redirect to admin page
                        mv = new ModelAndView("admin");
                        mv.addObject("status","SUCCESS");
                        mv.addObject("reason","User found(Admin) see user session variable.");
                    }
                    else
                    {
                        // redirect to user page
                        mv = new ModelAndView("user");
                        mv.addObject("status","SUCCESS");
                        mv.addObject("reason","User found(Customer) see user session variable.");
                    }
                    sessionUser = user;
                }
                else
                {
                    if(usm.get(auth.username) == null)
                    {
                        // user doesn't exists redirect to register page!
                        mv = new ModelAndView("register");
                        mv.addObject("status","FAILED");
                        mv.addObject("reason","User doesn't exists!");
                    }
                    else
                    {
                        // password wrong redirect to login page!
                        mv = new ModelAndView("index");
                        mv.addObject("status","FAILED");
                        mv.addObject("reason","Wrong Password!");
                    }
                }
            } catch (ClassNotFoundException ex) {
                mv = new ModelAndView("index");
                mv.addObject("status","FAILED");
                mv.addObject("reason","Connection Failed! Reason: " + ex.getMessage());
            }
            
        }
        return mv;
    }
    
}
