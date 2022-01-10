package com.capstone.rezervation.rezervation.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Owner;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.CouponRespository;
import com.capstone.rezervation.rezervation.repository.LotRepository;
import com.capstone.rezervation.rezervation.repository.OwnerRepository;
import com.capstone.rezervation.rezervation.repository.VehicleRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OwnerService {
    @Autowired
    private OwnerRepository repository;

    public Owner saveOwner(Owner owner) {
        return repository.save(owner);
    }

    public List<Owner> getOwners() {
        return repository.findAll();
    }

  
    public Owner getOwnerById(int id) {
        return repository.findById(id).orElse(null);
    }


}
