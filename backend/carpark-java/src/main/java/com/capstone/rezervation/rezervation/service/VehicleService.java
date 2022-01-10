package com.capstone.rezervation.rezervation.service;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.repository.VehicleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VehicleService {
    @Autowired
    private VehicleRepository repository;

    public Vehicle saveVehicle(Vehicle vehicle) {
        System.out.println("saving user");
        return repository.save(vehicle);
    }


    public List<Vehicle> getVehicles(){
        return repository.findAll();
    }

    public Vehicle getVehicleById(String id){
        return repository.findById(id).orElse(null);
    }

  

    public String deleteVehicle(String id){
        repository.deleteById(id);
        return "USer Deleted " + id;
    }
    
    
/*
    public Vehicle updateVehicle(Vehicle vehicle){
       Vehicle existingVehicle = repository.findById(vehicle.getId()).orElse(null);
       existingVehicle.setPlate(vehicl);
       existingUser.setName(user.getName());
       existingUser.setSurname(user.getSurname());
       return repository.save(existingUser);
    }*/
}
