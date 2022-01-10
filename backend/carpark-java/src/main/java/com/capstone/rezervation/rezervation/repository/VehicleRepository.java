package com.capstone.rezervation.rezervation.repository;

import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;

import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleRepository extends JpaRepository<Vehicle, String> {


    
}
