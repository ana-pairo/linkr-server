import express from "express";

import { signUpMiddleware } from "../middlewares/sign.middleware.js";
import { signUp } from "../controllers/sign.controller.js";

const router = express.Router();

router.post("/sign-up", signUpMiddleware, signUp);

export default router;
