import express from "express";
import {
  signUpMiddleware,
  signInMiddleware,
  authMiddleware,
} from "../middlewares/auth.middleware.js";
import { signUp, signIn, auth } from "../controllers/auth.controller.js";

const router = express.Router();

router.post("/sign-up", signUpMiddleware, signUp);
router.post("/sign-in", signInMiddleware, signIn);
router.get("/token", authMiddleware, auth);

export default router;
