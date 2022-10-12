import express from "express";
import { signIn, signUp } from "../controllers/auth.controllers.js";
import {
	loginValidationSchema,
	userValidationSchema,
} from "../middlewares/userSchema.middleware.js";

const authRouter = express.Router();

authRouter.post("/signup", userValidationSchema, signUp);
authRouter.post("/signin", loginValidationSchema, signIn);

export { authRouter };
