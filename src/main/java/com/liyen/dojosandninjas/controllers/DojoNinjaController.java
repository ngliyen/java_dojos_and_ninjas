package com.liyen.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liyen.dojosandninjas.models.Dojo;
import com.liyen.dojosandninjas.models.Ninja;
import com.liyen.dojosandninjas.services.DojoService;
import com.liyen.dojosandninjas.services.NinjaService;

@Controller
public class DojoNinjaController {
	private final DojoService dojoService;
	private final NinjaService ninjaService;
	
	public DojoNinjaController(DojoService dojoService,	NinjaService ninjaService) {
		this.dojoService = dojoService;
		this.ninjaService = ninjaService;
	}
	
	// form to create a new dojo
	@RequestMapping("/dojos/new")
	public String addDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "/dojos/new.jsp";
	}
	
	// create a new dojo
	@RequestMapping(value="/dojos", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
		if (result.hasErrors()) {
			return "/dojos/new.jsp";
		} else {
			dojoService.createDojo(dojo);
			return "redirect:/ninjas/new";
		}
	}
	
	// form to create new ninja
	@RequestMapping("/ninjas/new")
	public String addNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		return "/ninjas/new.jsp";
	}
	
	// create new ninja
	@RequestMapping(value="/ninjas", method=RequestMethod.POST)
	public String create(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
		if (result.hasErrors()) {
			List<Dojo> dojos = dojoService.allDojos();
			model.addAttribute("dojos", dojos);
			return "/ninjas/new.jsp";
		} else {
			// create ninja
			Ninja newNinja = ninjaService.createNinja(ninja);
			return "redirect:/dojos/" + newNinja.getDojo().getId(); // redirect to show page later
		}
	}
	
	// show dojo with all ninjas
	@RequestMapping("/dojos/{id}")
	public String dojoWithNinjas(@PathVariable("id") Long id, Model model) {
		Dojo dojo = dojoService.findDojo(id);
		model.addAttribute("dojo", dojo);
		return "/dojos/showDojo.jsp";
	}

}
