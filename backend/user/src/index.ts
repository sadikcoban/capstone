import express from "express";
import { json } from "body-parser";
import mongoose from "mongoose";
import "express-async-errors";
import cookieSession from "cookie-session";

import { createVehicleRouter } from "./routes/create-vehicle";
import { errorHandler } from "./middlewares/error-handler";

const app = express();

app.set("trust proxy", true);

app.use(json());
app.use(
  cookieSession({
    signed: false,
    secure: true,
  })
);
app.use(createVehicleRouter);

app.use(errorHandler);

const start = async () => {
  if (!process.env.JWT_KEY) {
    throw new Error("JWT_KEY must be defined");
  }
  try {
    await mongoose.connect("mongodb://user-mongo-srv:27017/user");
    console.log("conected to mongodb");
  } catch (error) {
    console.error(error);
  }

  app.listen(3002, () => {
    console.log("listening on port 3002");
  });
};

start();
