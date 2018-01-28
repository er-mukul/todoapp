package com.igt.apps.todo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.annotation.Resource;
import javax.validation.Valid;


import com.igt.apps.todo.enums.TaskStatus;
import com.igt.apps.todo.model.Task;
import com.igt.apps.todo.model.User;
import com.igt.apps.todo.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
	private UserService userService;
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String showLogin(ModelMap model) 
	{  System.out.println("werww");
		User p=new User();
      model.put("user",p);
	  return "Index";
	}

	@RequestMapping(value="/dologin",method=RequestMethod.POST)
      public String showSuccess(@Valid User user, BindingResult result, ModelMap model)
       { 
		if(result.hasErrors())
         { return "Index"; }
         System.out.println("Name:"+user.getPassword());
           User b=userService.fetchUser(user);
            if(b!=null)
             {  Task c=new Task();
             c.setUserDetails(b);
                model.put("task",c);
            	model.put("user",b);
            	model.put("tasks",b.getTasks());
            	if(b.getTasks()!=null){
					System.out.println("Name2:"+b.getTasks().size());
				}else{
					System.out.println("Name2:isnull");
				}

              return "profile";}
              else {model.addAttribute("msg","Invalid LoginId or Password!!");
	         return "Index";}

	  }
    @RequestMapping(value ="/add", method = RequestMethod.POST)
    public String add(@Valid Task task, BindingResult result,ModelMap model) {
		System.out.println("valid");

    	if(result.hasErrors())
		{  model.put("user",new User());
			return "Index";}
		System.out.println("valid2:"+task.getUserDetails().getUserId());
		task.setTaskStatus(TaskStatus.PENDING);
        Task taskr = userService.saveTask(task);
        Task newTask = new Task();
		User user = userService.getUserById(task.getUserDetails().getId());
        newTask.setUserDetails(user);
		model.put("task",newTask);
		model.put("user",user);
		model.put("tasks",user.getTasks());
		return "profile";
	}

	@RequestMapping(value ="/tasks/delete/{taskId}/{userId}", method = RequestMethod.GET)
	public String deleteTask(@PathVariable("taskId") Long taskId,@PathVariable("taskId") Long userId,ModelMap model) {
        userService.deleteTask(taskId);
        User user = userService.getUserById(userId);
		Task newTask = new Task();
		newTask.setUserDetails(user);
		model.put("task",newTask);
		model.put("user",user);
		model.put("tasks",user.getTasks());
		return "profile";
	}
	@RequestMapping(value ="/tasks/complete/{taskId}/{userId}", method = RequestMethod.GET)
	public String completeTask(@PathVariable("taskId") Long taskId,@PathVariable("taskId") Long userId,ModelMap model) {
		userService.updateTaskStatus(taskId);
		User user = userService.getUserById(userId);
		Task newTask = new Task();
		newTask.setUserDetails(user);
		model.put("task",newTask);
		model.put("user",user);
		model.put("tasks",user.getTasks());
		return "profile";
	}
}



