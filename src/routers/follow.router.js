import express from "express";
import { followMiddleware } from "../middlewares/follow.middleware.js";
import { follow, checkFollow } from "../controllers/follow.controller.js";

const router = express.Router();

router.post("/follow", followMiddleware, follow);
router.post("/followed", followMiddleware, checkFollow);

export default router;
