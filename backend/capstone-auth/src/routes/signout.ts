import express, { Response, Request } from "express";
import { authMiddleware } from "../middlewares/auth-middleware";

const router = express.Router();

router.post(
  "/api/users/signout",
  authMiddleware,
  (req: Request, res: Response) => {
    req.session = null;

    res.send({});
  }
);

export { router as signoutRouter };
