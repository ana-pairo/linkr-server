import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import likesRouter from "./routers/likes.router.js";
import postsRouter from "./routers/posts.router.js";
import trendsRouter from "./routers/trends.router.js";
import signRouter from "./routers/sign.router.js";

dotenv.config();

const server = express();
server.use(express.json());
server.use(cors());

server.use(trendsRouter);
server.use(postsRouter);
server.use(likesRouter);
server.use(signRouter);

server.get("/status", (req, res) => {
  res.sendStatus(200);
});

server.listen(
  process.env.PORT,
  console.log(`Listening to PORT ${process.env.PORT}`)
);
