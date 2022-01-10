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
@Table( name = "lots")

public class Lot {
    @Id
    private int id;
    private int floor_id;
    private String status;
    private String wrong_plate;
    private String lot_name;

    
}
