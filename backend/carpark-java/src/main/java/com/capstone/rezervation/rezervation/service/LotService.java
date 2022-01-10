package com.capstone.rezervation.rezervation.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.CouponRespository;
import com.capstone.rezervation.rezervation.repository.LotRepository;
import com.capstone.rezervation.rezervation.repository.VehicleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LotService {
    @Autowired
    private LotRepository repository;

    public Lot saveLot(Lot lot) {
        return repository.save(lot);
    }

    public List<Lot> getLots() {
        return repository.findAll();
    }

    public List<Lot> getLotsOfFloor(int floor_id) {
        List<Lot> all = getLots();
        List<Lot> res = new ArrayList<Lot>();
        for (int i = 0; i < all.size(); i++) {
            if (all.get(i).getFloor_id() == floor_id) {
                res.add(all.get(i));
            }

        }
        return res;
    }

    public Lot getLotById(int id) {
        return repository.findById(id).orElse(null);
    }

    public String deleteLot(int id) {
        repository.deleteById(id);
        return "lot Deleted " + id;
    }

    public Lot updateLot(Lot lot) {
        Lot existingLot = repository.findById(lot.getId()).orElse(null);
        existingLot.setWrong_plate(lot.getWrong_plate());
        existingLot.setStatus(lot.getStatus());
        return repository.save(existingLot);
    }

}
