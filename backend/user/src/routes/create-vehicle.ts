import express, { Request, Response } from "express";
import { body } from "express-validator";
import { Vehicle } from "../models/vehicle";
import { BadRequestError } from "../errors/bad-request-error";
import { validateRequest } from "../middlewares/validate-request";
import nats from "node-nats-streaming";

const router = express.Router();

router.post(
  "/api/user/vehicle",
  [
    body("plate")
      .isLength({ min: 5, max: 15 })
      .withMessage("Geçerli bir plaka giriniz"),
    body("user_id")
      .isLength({ min: 2 })
      .withMessage("Kullanıcı id'si girilmedi"),
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const { plate, user_id } = req.body;
    const existingVehicle = await Vehicle.findOne({ plate });
    if (existingVehicle) {
      throw new BadRequestError("Girmiş olduğunuz plaka kullanılmaktadır");
    }

    const vehicle = Vehicle.build({
      plate,
      user_id,
    });
    await vehicle.save();
    const stan = nats.connect("ticketing", "def", {
      url: "http://172.17.0.10:4222",
    }); //clientv

    //listen for connect events
    stan.on("connect", () => {
      console.log("Publisher connected to NATS");

      const data = [vehicle.id, user_id, plate];

      stan.publish("vehicle:created", data.toString(), () => {
        console.log("event published..");
      });
    });
    /*
    //generate jwt
    const userJwt = jwt.sign(
      {
        id: user.id,
        email: user.email,
      },
      process.env.JWT_KEY!
    );
    
    //store on session
    req.session = {
      jst: userJwt,
    };
   */
    return res.status(201).send(vehicle);
  }
);

export { router as createVehicleRouter };
