package com.capstone.rezervation.rezervation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.capstone.rezervation.rezervation.entity.Floor;
import com.capstone.rezervation.rezervation.entity.Location;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.Rezervation;
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.service.FloorService;
import com.capstone.rezervation.rezervation.service.LocationService;
import com.capstone.rezervation.rezervation.service.LotService;
import com.capstone.rezervation.rezervation.service.RezervationService;
import com.capstone.rezervation.rezervation.service.UserService;

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
public class RezervationController {
    @Autowired
    private RezervationService rezervationService;
    @Autowired
    private LocationService locationService;
    @Autowired
    private FloorService floorService;
    @Autowired
    private LotService lotService;

    @PostMapping("/step1")
    public ArrayList step1(
            @RequestParam(value = "location_id", required = true) int location_id,
            @RequestParam(value = "date", required = true) String date) {

        // get start and end hour of location

        // iterate trough hours, if an hour is available for any lot for that date say
        // yes give lot list to function
        Location location = locationService.findById(location_id);
        int start_hour = location.getStart_hour();
        int end_hour = location.getEnd_hour();
        List<Integer> floor_ids_of_loc = floorService.getAllIDSOfLocation(location_id);
        List<Lot> lots = locationService.getLotsOfLocation(floor_ids_of_loc);

        ArrayList list = new ArrayList();

        for (int i = start_hour; i <= end_hour; i++) {

            HashMap<String, Object> map = new HashMap<>();
            map.put("hour", i);
            boolean isAvailable = rezervationService.isAvailableToRezerve(date, i, lots);
            if (isAvailable) {
                map.put("available", true);
            } else {
                map.put("available", false);
            }

            list.add(map);

        }
        return list;

    }

    @PostMapping("/step2")
    public List<HashMap<String, Object>> step2(@RequestParam(value = "location_id", required = true) int location_id,
            @RequestParam(value = "date", required = true) String date,
            @RequestParam(value = "start", required = true) int start) {

        Location location = locationService.findById(location_id);
        int end_hour = location.getEnd_hour();
        List<Integer> floor_ids_of_loc = floorService.getAllIDSOfLocation(location_id);
        List<Lot> lots = locationService.getLotsOfLocation(floor_ids_of_loc);
        List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

        boolean isAvailable = false;
        boolean rezevation_found = false;
        for (int i = start + 1; i <= end_hour; i++) {

            HashMap<String, Object> map = new HashMap<>();
            map.put("hour", (i - start));

            if (!rezevation_found) {
                isAvailable = rezervationService.isAvailableToRezerveStep2(date, i, lots);
            }

            if (isAvailable) {
                map.put("available", true);
            } else {
                rezevation_found = true;
                map.put("available", false);
            }

            list.add(map);

        }
        return list;

    }

    @PostMapping("/step3")
    public List<HashMap<String, Object>> step3(@RequestParam(value = "location_id", required = true) int location_id,
            @RequestParam(value = "date", required = true) String date,
            @RequestParam(value = "start", required = true) int start,
            @RequestParam(value = "end", required = true) int end) {

        List<Floor> floors = floorService.getAllOfLocation(location_id);
        List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < floors.size(); i++) {
            Floor fl = floors.get(i);

            HashMap<String, Object> map = new HashMap<>();
            boolean isAvailable = rezervationService.isFloorAvailable(date, start, end, fl.getId());
            map.put("id", fl.getId());
            map.put("name", fl.getName());

            map.put("available", isAvailable);

            list.add(map);

        }
        return list;

    }

    @PostMapping("/step4")
    public List<HashMap<String, Object>> step4(@RequestParam(value = "location_id", required = true) int location_id,
            @RequestParam(value = "date", required = true) String date,
            @RequestParam(value = "start", required = true) int start,
            @RequestParam(value = "end", required = true) int end,
            @RequestParam(value = "floor_id", required = true) int floor_id) {

        List<Lot> lots = floorService.getLotsOfFloor(floor_id);

        List<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

        for (int i = 0; i < lots.size(); i++) {
            Lot lt = lots.get(i);

            HashMap<String, Object> map = new HashMap<>();
            boolean isAvailable = rezervationService.isLotAvailable(date, start, end, lt.getId());
            map.put("id", lt.getId());
            map.put("name", lt.getLot_name());

            map.put("available", isAvailable);

            list.add(map);

        }
        return list;

    }

    @PostMapping("/step5")
    public Rezervation step5(
            @RequestParam(value = "user_id", required = true) String user_id,
            @RequestParam(value = "vehicle_id", required = true) String vehicle_id,
            @RequestParam(value = "date", required = true) String date,
            @RequestParam(value = "start", required = true) int start,
            @RequestParam(value = "end", required = true) int end,
            @RequestParam(value = "lot_id", required = true) int lot_id) {

        Lot lot = lotService.getLotById(lot_id);
        Floor floor = floorService.getById(lot.getFloor_id());
        Location location = locationService.findById(floor.getLocation_id());
        double price = (end - start) * location.getPrice_per_hour();
        Rezervation rezervation = new Rezervation();
        rezervation.setDate(date);
        rezervation.setEnd_hour(end);
        rezervation.setStart_hour(start);
        rezervation.setLotId(lot_id);
        rezervation.setNet_price(price);
        rezervation.setPrice_calculated(price);
        rezervation.setUser_id(user_id);
        rezervation.setVehicle_id(vehicle_id);
        rezervation.setStatus("waiting");

        return rezervationService.save(rezervation);

    }

    // --status ENUM("free","waiting", "in_lot", "expired", "canceled", "done"):
    @GetMapping("/desktop-all-rezervations")
    public List<Rezervation> desktopAll() {
        List<Rezervation> all = rezervationService.getAll();
        for (int i = 0; i < all.size(); i++) {
            Rezervation r = all.get(i);
            if (r.getStatus() == "waiting") {
                r.setStatus("Beklemede");
            } else if (r.getStatus() == "in_lot") {
                r.setStatus("Alanda");
            } else if (r.getStatus() == "expired") {
                r.setStatus("Geçmiş");
            } else if (r.getStatus() == "canceled") {
                r.setStatus("İptal edildi");
            } else {
                r.setStatus("Tamamlandı");
            }

        }

        return all;
    }

    @PostMapping("/user-rezervations")
    public List<Rezervation> userAll(@RequestParam(value = "user_id", required = true) String user_id) {
        List<Rezervation> all = rezervationService.getAll();
        List<Rezervation> users = new ArrayList<Rezervation>();
        for (int i = 0; i < all.size(); i++) {
            Rezervation r = all.get(i);
            if (r.getUser_id().equals(user_id)) {

                if (r.getStatus() == "waiting") {
                    r.setStatus("Beklemede");
                } else if (r.getStatus() == "in_lot") {
                    r.setStatus("Alanda");
                } else if (r.getStatus() == "expired") {
                    r.setStatus("Geçmiş");
                } else if (r.getStatus() == "canceled") {
                    r.setStatus("İptal edildi");
                } else {
                    r.setStatus("Tamamlandı");
                }
                users.add(r);

            }

        }

        return users;
    }
}
