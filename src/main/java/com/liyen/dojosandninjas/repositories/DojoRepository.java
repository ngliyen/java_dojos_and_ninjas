package com.liyen.dojosandninjas.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.liyen.dojosandninjas.models.Dojo;

public interface DojoRepository extends CrudRepository<Dojo,Long> {
	List<Dojo> findAll();

}
