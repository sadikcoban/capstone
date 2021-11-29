import { Request, Response, NextFunction } from "express";
import jwt from "jsonwebtoken";

export const authMiddleware = (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (!req.header("token")) {
    return res.status(401).send({ errors: ["unauthorized"] });
  }
  try {
    const payload = jwt.verify(req.header('token')!, process.env.JWT_KEY!);
  } catch (err) {
    return res.status(401).send({ errors: ["unauthorized2"] });
  }

  next();
};
