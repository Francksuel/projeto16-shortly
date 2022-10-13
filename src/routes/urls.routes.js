import express from "express";
import { addShorten, getUrl, openUrl, deleteUrl } from "../controllers/urls.controllers.js";
import {checkUser} from "../middlewares/authorization.middleware.js"
import { urlValidationSchema } from "../middlewares/urlSchema.middleware.js";

const urlsRouter = express.Router();

urlsRouter.post("/urls/shorten", checkUser,urlValidationSchema, addShorten);
urlsRouter.get("/urls/:id", getUrl);
urlsRouter.get("/urls/open/:shortUrl", openUrl);
urlsRouter.delete("/urls/:id", checkUser, deleteUrl);

export { urlsRouter };