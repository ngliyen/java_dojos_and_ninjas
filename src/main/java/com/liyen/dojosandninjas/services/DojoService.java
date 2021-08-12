package com.liyen.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.liyen.dojosandninjas.models.Dojo;
import com.liyen.dojosandninjas.repositories.DojoRepository;


@Service
public class DojoService {
	private final DojoRepository dojoRepository;
	
	public DojoService(DojoRepository dojoRepository) {
		this.dojoRepository = dojoRepository;
	}
	
	// show all (for ninja create form)
	public List<Dojo> allDojos() {
		return dojoRepository.findAll();
	}
	
	// show one dojo by id
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepository.findById(id);
		if(optionalDojo.isPresent()) {
			return optionalDojo.get();
		} else {
			return null;
		}
	}
	
	// create a dojo
	public Dojo createDojo(Dojo dojo) {
		return dojoRepository.save(dojo);
	}
}
