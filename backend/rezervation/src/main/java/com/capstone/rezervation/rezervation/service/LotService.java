package com.capstone.rezervation.rezervation.service;

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

    public Lot getLotById(int id) {
        return repository.findById(id).orElse(null);
    }

    public String deleteLot(int id) {
        repository.deleteById(id);
        return "lot Deleted " + id;
    }

    public Lot updateLot(Lot lot) {
        Lot existingLot = repository.findById(lot.getId()).orElse(null);
        existingLot.setWrongPlate(lot.getWrongPlate());
        existingLot.setStatus(lot.getStatus());
        return repository.save(existingLot);
    }

}
