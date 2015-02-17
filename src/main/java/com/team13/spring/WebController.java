package com.team13.spring;


import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;


import com.team13.spring.model.Person;
import com.team13.spring.service.PersonService;


@Controller
public class WebController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam(value = "login", required = false, defaultValue = "false") Boolean login) {
		
		ModelAndView model = new ModelAndView();
		
		if(login) {
			
			//Logged in
			model.addObject("authenticated", true);
			model.addObject("username", "Craig");
	
		} else {
			
			//Not logged in
			model.addObject("authenticated", false);
			
		}
		
		model.setViewName("home");
		
		return model;
	}
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard() {
		
		ModelAndView model = new ModelAndView();
		
		Boolean loggedIn = true;
		
		if(loggedIn) {
			
			//Logged in
			model.addObject("authenticated", true);
			model.addObject("username", "Craig");
	
		} else {
			
			//Not logged in
			model.addObject("authenticated", false);
			
		}
		
		model.setViewName("dashboard");
		
		return model;
	}
	
	@RequestMapping(value = "/add/{one}/{two}", method = RequestMethod.GET)
	public @ResponseBody String Test(@PathVariable("one") int one, @PathVariable("two") int two){
		int result = one + two;
		
		return new Integer(result).toString();
	}
	
	//Experiments below -----------------------------------------

	private PersonService personService;
	
	@Autowired(required=true)
	@Qualifier(value="personService")
	public void setPersonService(PersonService ps){
		this.personService = ps;
	}
	
	@RequestMapping(value = "/persons", method = RequestMethod.GET)
	public String listPersons(Model model) {
		model.addAttribute("person", new Person());
		model.addAttribute("listPersons", this.personService.listPersons());
		return "person";
	}
	
	
	//For add and update person both
	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("person") Person p){
		
		if(p.getId() == 0){
			//new person, add it
			this.personService.addPerson(p);
		}else{
			//existing person, call update
			this.personService.updatePerson(p);
		}
		
		return "redirect:/persons";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removePerson(@PathVariable("id") int id){
		
        this.personService.removePerson(id);
        return "redirect:/persons";
    }
 
    @RequestMapping("/edit/{id}")
    public String editPerson(@PathVariable("id") int id, Model model){
        model.addAttribute("person", this.personService.getPersonById(id));
        model.addAttribute("listPersons", this.personService.listPersons());
        return "person";
    }
    

	
}
