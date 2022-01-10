package com.capstone.rezervation.rezervation.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Location;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.CouponRespository;
import com.capstone.rezervation.rezervation.repository.LocationRepository;
import com.capstone.rezervation.rezervation.repository.LotRepository;
import com.capstone.rezervation.rezervation.repository.VehicleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationService {
    @Autowired
    private LocationRepository repository;
    
    @Autowired FloorService floorService;

    public Location saveLocation(Location location) {
        return repository.save(location);
    }

    public Location findById(int id){
        return repository.findById(id).orElse(null);
    }

    public List<Lot> getLotsOfLocation(List<Integer> floor_ids) {
        List<Lot> lots = new ArrayList<Lot>();
        for (int i = 0; i < floor_ids.size(); i++) {
            List<Lot> list = floorService.getLotsOfFloor(floor_ids.get(i));
            lots.addAll(list);
            
        }
        return lots;
    }

}
