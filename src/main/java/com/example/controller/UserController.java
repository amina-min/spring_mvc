package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.Repository.UserRepo;
import com.example.model.UserModel;

@Controller
public class UserController {

	@Autowired
	private UserRepo userRepo;

	@GetMapping("/")
	public ModelAndView indexpage() {

		Map<String, Object> map = new HashMap<String, Object>();
		return new ModelAndView("index");
	}

	@PostMapping("/save")
	public ModelAndView save(ModelMap map, @ModelAttribute UserModel userModel) {
		try {
			userModel = userRepo.save(userModel);
			map.put("Model", userModel);
			map.put("Status", "Success");
			map.put("Message", "Data Save Successfull");
		} catch (Exception e) {
			map.put("Status", "Failed");
			map.put("Message", "Data Save Failed");
			// TODO: handle exception
		}
		return new ModelAndView("index", map);
	}
	
	
	
	@GetMapping("/show")
	public ModelAndView showUsersPage(ModelMap map) {
		List<UserModel> users = (List<UserModel>) userRepo.findAll();
		map.put("users", users);	
		return new ModelAndView("userInformation" ,"data", map);
	}
	
	

	@GetMapping("/edit/{id}")
	public ModelAndView Edit(@PathVariable(value = "id") Integer id, ModelMap map) {
		UserModel user =  userRepo.findById(id).get();
		map.put("user", user);
		return new ModelAndView("editUser", "data", map);
	}
	
	
	@PostMapping("/update")
	public ModelAndView update(@ModelAttribute UserModel userModel,ModelMap map) {
	try {
		userModel = userRepo.save(userModel);
	map.put("model", userModel);
	map.put("status", "Success");
	map.put("message", "Data updated Successfull");
	} catch (Exception e) {
	map.put("status", "Failed");
	map.put("message", e.getLocalizedMessage());
	}
	return new ModelAndView("editUser", "data", map);
	}
	
	
	
	
	
	@GetMapping("/delete/{id}")
	public ModelAndView deleteUsers(@PathVariable (value = "id") Integer id, ModelMap map) {
		
		UserModel model =userRepo.findById(id).get();
		userRepo.delete(model);
		try {
			map.put("message", "delete successfull");			
		} catch (Exception e) {
			// TODO: handle exception
		}	
		
		return new ModelAndView("redirect:/show",map);
	}

}
