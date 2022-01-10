import express, { Request, Response } from "express";
import { body } from "express-validator";
import { User } from "../models/user";
import { BadRequestError } from "../errors/bad-request-error";
import { validateRequest } from "../middlewares/validate-request";

import jwt from "jsonwebtoken";
import nats from "node-nats-streaming"
const router = express.Router();

router.post(
  "/api/auth/signup",
  [
    body("email").isEmail().withMessage("Email must be valid"),
    body("password")
      .trim()
      .isLength({ min: 4, max: 20 })
      .withMessage("Password must be between 4 and 20 characters"),
  ],
  validateRequest,
  async (req: Request, res: Response) => {
    const {
      email,
      phone,
      name,
      surname,
      address,
      birthDate,
      balance,
      password,
    } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      throw new BadRequestError("Email in use");
    }

    const user = User.build({
      email,
      phone,
      name,
      surname,
      address,
      birthDate,
      balance,
      password,
    });
    await user.save();
    const stan = nats.connect("ticketing", "abc", {
      url: "http://172.17.0.23:4222",
    }); //clientv
    
    //listen for connect events
    stan.on("connect", () => {
      console.log("Publisher connected to NATS");
    
      const data = [user.id, name, surname];
    
      stan.publish("user:created", data.toString(), () => {
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
    console.log("dsasd");
    return res.status(201).send(user);
  }
);

export { router as signupRouter };
