package com.capstone.rezervation.rezervation.service;

import java.util.ArrayList;
import java.util.List;

import com.capstone.rezervation.rezervation.entity.Floor;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.repository.FloorRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FloorService {
    @Autowired
    private FloorRepository repository;
    @Autowired
    private LotService lotService;

    public Floor saveFloor(Floor floor) {
        return repository.save(floor);
    }

    public Floor getById(int id) {
        return repository.findById(id).orElse(null);
    }

    public List<Floor> getAllOfLocation(int location_id) {
        List<Floor> all = repository.findAll();
        List<Floor> res = new ArrayList<Floor>();
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getLocation_id() == location_id) {
                res.add(all.get(i));
            }

        }
        return res;
    }

    public List<Integer> getAllIDSOfLocation(int location_id) {
        List<Floor> all = repository.findAll();
        List<Integer> res = new ArrayList<Integer>();

        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getLocation_id() == location_id) {

                res.add(all.get(i).getId());
            }

        }
        return res;
    }



    


    public List<Lot> getLotsOfFloor(int floor_id){
        return lotService.getLotsOfFloor(floor_id);


    }

}
