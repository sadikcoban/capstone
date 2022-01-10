package com.capstone.rezervation.rezervation.repository;

import com.capstone.rezervation.rezervation.entity.Rezervation;
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RezervationRepository extends JpaRepository<Rezervation, Integer> {


    
}
