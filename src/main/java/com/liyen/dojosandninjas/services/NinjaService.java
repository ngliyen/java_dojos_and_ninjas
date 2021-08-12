package com.liyen.dojosandninjas.services;

import org.springframework.stereotype.Service;

import com.liyen.dojosandninjas.models.Ninja;
import com.liyen.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
	private final NinjaRepository ninjaRepository;
	
	public NinjaService(NinjaRepository ninjaRepository) {
		this.ninjaRepository = ninjaRepository;
	}
	
	// create a ninja
	public Ninja createNinja(Ninja ninja) {
		return ninjaRepository.save(ninja);
	}
	
}
