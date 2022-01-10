package com.capstone.rezervation.rezervation.controller;

import com.capstone.rezervation.rezervation.entity.Location;
import com.capstone.rezervation.rezervation.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LocationController {
    @Autowired
    private LocationService service;

    public Location addLocationEvent(int id, int start_hour, int end_hour, int capacity, float price_per_hour, String name) {
        Location newLocation = new Location();
        newLocation.setId(id);
        newLocation.setCapacity(capacity);
        newLocation.setStart_hour(start_hour);
        newLocation.setEnd_hour(end_hour);
        newLocation.setPrice_per_hour(price_per_hour);
        newLocation.setName(name);
        return service.saveLocation(newLocation);
    }

    
     

}
