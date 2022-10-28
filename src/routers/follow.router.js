import express from "express";
import { followMiddleware } from "../middlewares/follow.middleware.js";
import { follow, checkFollow, getFollowersByUser } from "../controllers/follow.controller.js";

const router = express.Router();

router.get("/followers/:userId", getFollowersByUser);
router.post("/follow", followMiddleware, follow);
router.post("/followed", followMiddleware, checkFollow);

export default router;
