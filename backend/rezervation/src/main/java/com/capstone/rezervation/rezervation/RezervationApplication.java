package com.capstone.rezervation.rezervation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import io.nats.*;
import io.nats.streaming.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import java.util.concurrent.CountDownLatch;

import com.capstone.rezervation.rezervation.controller.UserController;
import com.capstone.rezervation.rezervation.entity.Floor;
import com.capstone.rezervation.rezervation.entity.Location;
import com.capstone.rezervation.rezervation.entity.Lot;
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.entity.Vehicle;
import com.capstone.rezervation.rezervation.repository.FloorRepository;
import com.capstone.rezervation.rezervation.repository.LocationRepository;
import com.capstone.rezervation.rezervation.repository.LotRepository;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.repository.VehicleRepository;
import com.capstone.rezervation.rezervation.service.UserService;

@SpringBootApplication
public class RezervationApplication {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private VehicleRepository vehicleRepository;
	@Autowired
	private LotRepository lotRepository;
	@Autowired
	private LocationRepository locationRepository;
	@Autowired
	private FloorRepository floorRepository;

	public static void main(String[] args) {
		SpringApplication.run(RezervationApplication.class, args);
	}

	@Bean
	CommandLineRunner CommandLineRunner() {
		return args -> {
			// Create a connection factory
			StreamingConnectionFactory cf = new StreamingConnectionFactory("ticketing", "bar");

			// A StreamingConnection is a logical connection to the NATS streaming
			// server. This API creates an underlying core NATS connection for
			// convenience and simplicity. In most cases one would create a secure
			// core NATS connection and pass it in via
			// StreamingConnectionFactory.setNatsConnection(Connection nc)
			StreamingConnection sc = cf.createConnection();

			// This simple synchronous publish API blocks until an acknowledgement
			// is returned from the server. If no exception is thrown, the message
			// has been stored in NATS streaming.
			// sc.publish("ticket:created", "Hello World".getBytes());

			// Use a countdown latch to wait for our subscriber to receive the
			// message we published above.
			final CountDownLatch doneSignal = new CountDownLatch(1);

			// Simple Async Subscriber that retrieves all available messages.
			Subscription subAuth = sc.subscribe("user:created", new MessageHandler() {
				public void onMessage(Message m) {
					// System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					String[] list = data.split(",");
					String id = list[0];
					String name = list[1];
					String surname = list[2];

					User user = new User(id, name, surname);
					userRepository.save(user);

					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			Subscription subUser = sc.subscribe("vehicle:created", new MessageHandler() {
				public void onMessage(Message m) {
					// System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					String[] list = data.split(",");
					String id = list[0];
					String user_id = list[1];
					String plate = list[2];

					Vehicle vehicle = new Vehicle();
					vehicle.setId(id);
					vehicle.setPlate(plate);
					vehicle.setUser_id(user_id);
					vehicleRepository.save(vehicle);

					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			Subscription subLotCr = sc.subscribe("lot:created", new MessageHandler() {
				public void onMessage(Message m) {
					// System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					String[] list = data.split(",");

					String id = list[0];
					String floor_id = list[1];
					String lot_name = list[2];

					Lot lot = new Lot();
					lot.setId(Integer.parseInt(id));
					lot.setFloor_id(Integer.parseInt(floor_id));
					lot.setLot_name(lot_name);
					lot.setStatus("free");
					lot.setWrong_plate("");
					lotRepository.save(lot);

					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			Subscription subLotUp = sc.subscribe("lot:updated", new MessageHandler() {
				public void onMessage(Message m) {
					// System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					String[] list = data.split(",");

					String id = list[0];
					String status = list[1];
					String wrong_plate = list[2];

					Lot lot = lotRepository.getById(Integer.parseInt(id));
					lot.setStatus(status);
					lot.setWrong_plate(wrong_plate);
					lotRepository.save(lot);

					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			Subscription subLoc = sc.subscribe("location:created", new MessageHandler() {
				public void onMessage(Message m) {
					// System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					/**
					 * private int id;
					 * private int start_hour;
					 * private int end_hour;
					 * private int capacity;
					 * private float price_per_hour;
					 * private String name;
					 */
					String[] list = data.split(",");

					String id = list[0];
					String start_hour = list[1];
					String end_hour = list[2];
					String capacity = list[3];
					String price_per_hour = list[4];
					String name = list[5];

					Location location = new Location();
					location.setId(Integer.parseInt(id));
					location.setStart_hour(Integer.parseInt(start_hour));
					location.setEnd_hour(Integer.parseInt(end_hour));
					location.setCapacity(Integer.parseInt(capacity));
					location.setPrice_per_hour(Float.parseFloat(price_per_hour));
					location.setName(name);
					locationRepository.save(location);

					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			Subscription subFlo = sc.subscribe("floor:created", new MessageHandler() {
				public void onMessage(Message m) {
					// System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					/**
					 *  private int id;
    private int location_id;
    private String name;
					 */
					String[] list = data.split(",");

					String id = list[0];
					String location_id = list[1];
					String name = list[2];

					Floor floor = new Floor();
					floor.setId(Integer.parseInt(id));
					floor.setLocation_id(Integer.parseInt(location_id));
					floor.setName(name);
					floorRepository.save(floor);
				


					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			doneSignal.await();

		};
	}

}
