package com.capstone.rezervation.rezervation.controller;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Owner;
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.service.CouponService;
import com.capstone.rezervation.rezervation.service.LotService;
import com.capstone.rezervation.rezervation.service.OwnerService;
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
public class OwnerController {
    @Autowired
    private OwnerService service;

    @PostMapping("/owner")
    public Owner create(@PathVariable int id) {
        return service.getLotById(id);
    }/*
    @GetMapping("/lot/{id}")
    public Lot getLot(@PathVariable int id) {
        return service.getLotById(id);
    }

    @GetMapping("/lots")
    public List<Lot> getLots() {
        return service.getLots();
    }
    
      @PutMapping(value="/lot/update")
      public Lot updateLot(@RequestBody Lot lot) {
      return service.updateLot(lot);
      }

*/
     

}
