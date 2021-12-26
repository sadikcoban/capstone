package com.capstone.rezervation.rezervation.controller;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.service.UserService;
import com.capstone.rezervation.rezervation.service.VehicleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
public class VehicleController {
    @Autowired
    private VehicleService service;

    @PostMapping("/addvehicle")
    public Vehicle addVehicle(@RequestParam(value = "id", required = true) String id,
            @RequestParam(value = "user_id", required = true) String userId,
            @RequestParam(value = "plate", required = true) String plate) {
        Vehicle newVehicle = new Vehicle();
        newVehicle.setId(id);
        newVehicle.setPlate(plate);
        newVehicle.setUserId(userId);
        return service.saveVehicle(newVehicle);
    }

    public Vehicle addVehicleEvent(String id, String userId, String plate) {
        Vehicle newVehicle = new Vehicle();
        newVehicle.setId(id);
        newVehicle.setPlate(plate);
        newVehicle.setUserId(userId);
        return service.saveVehicle(newVehicle);
    }

   

    @GetMapping("/vehicle/{id}")
    public Vehicle getVehicle(@PathVariable String id) {
        return service.getVehicleById(id);
    }
    @GetMapping("/vehicles")
    public List<Vehicle> getVehicles() {
        return service.getVehicles();
    }
    /*
      @PutMapping(value="/vehicle/update")
      public Vehicle updateVehicle(@RequestBody Vehicle vehicle) {
      return service.updateVehicle(vehicle);
      }
     */

    @DeleteMapping(value = "/vehicle/delete/{id}")
    public String deleteVehicle(@PathVariable String id) {
        return service.deleteVehicle(id);
    }

}
