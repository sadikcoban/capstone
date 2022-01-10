package com.capstone.rezervation.rezervation.controller;

import com.capstone.rezervation.rezervation.entity.Floor;
import com.capstone.rezervation.rezervation.entity.Location;
import com.capstone.rezervation.rezervation.service.FloorService;
import com.capstone.rezervation.rezervation.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FloorController {
    @Autowired
    private FloorService service;

    public Floor addFloorEvent(int id, int location_id, String name) {
        Floor floor = new Floor();
        floor.setId(id);
        floor.setLocation_id(location_id);
        floor.setName(name);
        return service.saveFloor(floor);
    }

    
     

}
