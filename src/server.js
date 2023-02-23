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
import commentsRouter from "./routers/comments.router.js";
import { authMiddleware } from "./middlewares/auth.middleware.js";
import https from "https";
import * as fs from "fs";

const options = {
  key: fs.readFileSync("./src/config/server.key"),
  cert: fs.readFileSync("./src/config/server.cert"),
};

dotenv.config();

const server = express();
server.use(express.json());
server.use(cors());

server.get("/status", (req, res) => {
  return res.sendStatus(200);
});

server.use(authRouter);
server.use(authMiddleware);
server.use(trendsRouter);
server.use(postsRouter);
server.use(likesRouter);
server.use(usersRouter);
server.use(followRouter);
server.use(sharesRouter);
server.use(commentsRouter);

https
  .createServer(options, server)
  .listen(
    process.env.PORT || 4002,
    console.log(`Listening to PORT ${process.env.PORT}`)
  );
