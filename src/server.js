import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import likesRouter from "./routers/likes.router.js";
import postsRouter from "./routers/posts.router.js";
import trendsRouter from "./routers/trends.router.js";
import authRouter from "./routers/auth.router.js";
import usersRouter from "./routers/users.router.js";
import followRouter from "./routers/follow.router.js";
import sharesRouter from "./routers/shares.router.js";
import { authMiddleware } from "./middlewares/auth.middleware.js";

dotenv.config();

const server = express();
server.use(express.json());
server.use(cors());

server.use(authRouter);

server.use(authMiddleware);

server.use(trendsRouter);
server.use(postsRouter);
server.use(likesRouter);
server.use(usersRouter);
server.use(followRouter);
server.use(sharesRouter);

server.get("/status", (req, res) => {
  res.sendStatus(200);
});

server.listen(
  process.env.PORT,
  console.log(`Listening to PORT ${process.env.PORT}`)
);
