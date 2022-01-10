package com.capstone.rezervation.rezervation.repository;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.Location;
import com.capstone.rezervation.rezervation.entity.Lot;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LocationRepository extends JpaRepository<Location, Integer> {


    
}
