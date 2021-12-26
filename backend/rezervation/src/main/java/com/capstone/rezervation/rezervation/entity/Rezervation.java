package com.capstone.rezervation.rezervation.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "lots")

public class Rezervation {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private int lotId;
    private String start;
    private String end;
    private Double priceCalculated;
    private String couponId;
    private Double netPrice;
    private String vehicleId;
    private Status status;
    private String userId;

    public enum Status {
        waiting, in_lot, expired, canceled, done
    }
}