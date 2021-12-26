package com.capstone.rezervation.rezervation.controller;

import java.util.List;

import com.capstone.rezervation.rezervation.entity.Coupon;
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.service.CouponService;
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
public class CouponController {
    @Autowired
    private CouponService service;

    @PostMapping("/addcoupon")
    public Coupon addCoupon(@RequestParam(value = "id", required = true) String id,
            @RequestParam(value = "name", required = true) String name,
            @RequestParam(value = "explanation", required = true) String explanation,
            @RequestParam(value = "user_id", required = true) String userId,
            @RequestParam(value = "discount_rate", required = true) Double discountRate) {
        Coupon newCoupon = new Coupon();
        newCoupon.setId(id);
        newCoupon.setName(name);
        newCoupon.setExplanation(explanation);
        newCoupon.setUserId(userId);
        newCoupon.setDiscountRate(discountRate);
        return service.saveCoupon(newCoupon);
    }

    public Coupon addCouponEvent(String id,String name, String explanation,String userId, Double discountRate) {
Coupon newCoupon = new Coupon();
newCoupon.setId(id);
newCoupon.setName(name);
newCoupon.setExplanation(explanation);
newCoupon.setUserId(userId);
newCoupon.setDiscountRate(discountRate);
return service.saveCoupon(newCoupon);
}


    @GetMapping("/coupon/{id}")
    public Coupon getCoupon(@PathVariable String id) {
        return service.getCouponById(id);
    }

    @GetMapping("/coupons")
    public List<Coupon> getCoupons() {
        return service.getCoupons();
    }
    /*
     * @PutMapping(value="/vehicle/update")
     * public Vehicle updateVehicle(@RequestBody Vehicle vehicle) {
     * return service.updateVehicle(vehicle);
     * }
     */

    @DeleteMapping(value = "/coupon/delete/{id}")
    public String deleteCoupon(@PathVariable String id) {
        return service.deleteCoupon(id);
    }

}
