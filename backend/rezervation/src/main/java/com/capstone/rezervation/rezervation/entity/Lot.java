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
    private String status;
    private String wrongPlate;
    private String lotName;
    private String floorName;

    
}
