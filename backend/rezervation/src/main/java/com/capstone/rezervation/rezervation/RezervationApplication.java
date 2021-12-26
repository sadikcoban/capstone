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
import com.capstone.rezervation.rezervation.entity.User;
import com.capstone.rezervation.rezervation.repository.UserRepository;
import com.capstone.rezervation.rezervation.service.UserService;


@SpringBootApplication
public class RezervationApplication {
	@Autowired
    private UserRepository repository;


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
			//StreamingConnectionFactory.setNatsConnection(Connection nc)
			StreamingConnection sc = cf.createConnection();

			// This simple synchronous publish API blocks until an acknowledgement
			// is returned from the server. If no exception is thrown, the message
			// has been stored in NATS streaming.
			//sc.publish("ticket:created", "Hello World".getBytes());

			// Use a countdown latch to wait for our subscriber to receive the
			// message we published above.
			final CountDownLatch doneSignal = new CountDownLatch(1);

			// Simple Async Subscriber that retrieves all available messages.
			Subscription sub = sc.subscribe("user:created", new MessageHandler() {
				public void onMessage(Message m) {
					//System.out.println("Received a message: " + m.getData());
					String data = new String(m.getData());
					System.out.println(data);
					String[] list = data.split(",");
					String id = list[0];
					String name = list[1];
					String surname = list[2];
				
					User user = new User(id, name, surname);
					repository.save(user);

					doneSignal.countDown();
				}
			}, new SubscriptionOptions.Builder().deliverAllAvailable().build());

			doneSignal.await();

		};
	}


}
