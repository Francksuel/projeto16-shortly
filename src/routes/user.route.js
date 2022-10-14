import express from "express";
import { getUserData } from "../controllers/user.controller.js";
import { checkUser } from "../middlewares/authorization.middleware.js";

const usersRouter = express.Router();

usersRouter.get("/users/me", checkUser, getUserData);

export { usersRouter };
