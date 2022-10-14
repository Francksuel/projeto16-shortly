import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { authRouter } from "./routes/auth.routes.js";
import { urlsRouter } from "./routes/urls.routes.js";
import { usersRouter } from "./routes/user.route.js";
import { rankingRouter } from "./routes/ranking.route.js";

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

app.use(authRouter);
app.use(urlsRouter);
app.use(usersRouter);
app.use(rankingRouter);

app.listen(process.env.PORT, () => {
	console.log("Listening on port " + process.env.PORT);
});
