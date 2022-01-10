package com.capstone.rezervation.rezervation.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.capstone.rezervation.rezervation.entity.Floor;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Rezervation;
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.repository.RezervationRepository;
import com.capstone.rezervation.rezervation.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RezervationService {
    @Autowired
    private RezervationRepository repository;
    @Autowired
    private FloorService floorService;
    @Autowired
    private LotService lotService;

    public List<Rezervation> getAll() {
        return repository.findAll();
    }

    public Rezervation save(Rezervation rezervation){
        return repository.save(rezervation);
    }

    public List<Rezervation> todaysOfTime(String date, int hour) {
        List<Rezervation> all = repository.findAll();
        List<Rezervation> todays = new ArrayList<Rezervation>();

        for (int i = 0; i < all.size(); i++) {
            Rezervation rez = all.get(i);

            if ((rez.getDate().equals(date)) && ((rez.getStart_hour() <= hour) && (hour < rez.getEnd_hour()))) {
                System.out.println("added hour: " + hour);
                System.out.println("start: " + rez.getStart_hour());
                System.out.println("end: " + rez.getEnd_hour());
                todays.add(rez);
            }
        }

        return todays;

    }

    public List<Rezervation> todaysOfTimeStep2(String date, int hour) {
        List<Rezervation> all = repository.findAll();
        List<Rezervation> todays = new ArrayList<Rezervation>();

        for (int i = 0; i < all.size(); i++) {
            Rezervation rez = all.get(i);

            if ((rez.getDate().equals(date)) && ((rez.getStart_hour() < hour) && (hour <= rez.getEnd_hour()))) {
                System.out.println("added hour: " + hour);
                System.out.println("start: " + rez.getStart_hour());
                System.out.println("end: " + rez.getEnd_hour());
                todays.add(rez);
            }
        }

        return todays;

    }

    public boolean isAvailableToRezerve(String date, int hour, List<Lot> lots) {
        List<Rezervation> todays = todaysOfTime(date, hour);
        System.out.println(todays.size());
        System.out.println(lots.size());
        if (todays.size() < lots.size()) {
            return true;
        }

        for (int i = 0; i < lots.size(); i++) {
            Lot lot = lots.get(i);

            for (int j = 0; j < todays.size(); j++) {
                Rezervation rez = todays.get(j);
                if (rez.getLotId() == lot.getId()) {
                    break;
                }
                if (j == todays.size() - 1) {
                    return true;
                }

            }
        }
        return false;
    }

    public boolean isAvailableToRezerveStep2(String date, int hour, List<Lot> lots) {
        List<Rezervation> todays = todaysOfTimeStep2(date, hour);
        System.out.println(todays.size());
        System.out.println(lots.size());
        if (todays.size() < lots.size()) {
            return true;
        }

        for (int i = 0; i < lots.size(); i++) {
            Lot lot = lots.get(i);

            for (int j = 0; j < todays.size(); j++) {
                Rezervation rez = todays.get(j);
                if (rez.getLotId() == lot.getId()) {
                    break;
                }
                if (j == todays.size() - 1) {
                    return true;
                }

            }
        }
        return false;
    }

    public boolean isFloorAvailable(String date, int start, int end, int floor_id) {
        List<Lot> lots = floorService.getLotsOfFloor(floor_id);
        List<Rezervation> todays = todaysOfTimeStep3(date, start, end);
        System.out.println("step3 todays: " + todays.size());
        if (todays.size() < lots.size()) {
            return true;
        }
        for (int i = 0; i < lots.size(); i++) {
            Lot lot = lots.get(i);

            for (int j = 0; j < todays.size(); j++) {
                Rezervation rez = todays.get(j);
                if (rez.getLotId() == lot.getId()) {
                    break;
                }
                if (j == todays.size() - 1) {
                    return true;
                }

            }

        }
        return false;

    }


    public List<Rezervation> todaysOfTimeStep3(String date, int start, int end) {
        List<Rezervation> all = repository.findAll();
        List<Rezervation> todays = new ArrayList<Rezervation>();

        for (int i = 0; i < all.size(); i++) {
            Rezervation rez = all.get(i);

            if ((rez.getDate().equals(date)) && ((start <= rez.getStart_hour()) && (rez.getEnd_hour() <= end))) {

                todays.add(rez);
            }
        }

        return todays;

    }

    public boolean isLotAvailable(String date, int start, int end, int lot_id) {
        List<Rezervation> todays = todaysOfTimeStep3(date, start, end);
        

            for (int j = 0; j < todays.size(); j++) {
                Rezervation rez = todays.get(j);
                if (rez.getLotId() == lot_id) {
                    if(start<=rez.getStart_hour() || rez.getEnd_hour() <=end){
                        return false;
                    }
                }
               

            }

        
        return true;

    }

    /*
     * 
     * public User saveUser(User user) {
     * System.out.println("saving user");
     * return repository.save(user);
     * }
     * 
     * public List<User> saveUsers(List<User> users) {
     * return repository.saveAll(users);
     * 
     * }
     * 
     * 
     * public List<User> getUsers(){
     * return repository.findAll();
     * }
     * 
     * public User getUserById(String id){
     * return repository.findById(id).orElse(null);
     * }
     * 
     * public User getUserByName(String name){
     * return repository.findByName(name);
     * }
     * 
     * public String deleteUser(String id){
     * repository.deleteById(id);
     * return "USer Deleted " + id;
     * }/*
     * 
     * public User updateUser(User user){
     * User existingUser = repository.findById(user.getId()).orElse(null);
     * existingUser.setName(user.getName());
     * existingUser.setSurname(user.getSurname());
     * return repository.save(existingUser);
     * }
     */
}
