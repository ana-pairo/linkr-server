import express from "express";
import { getComments } from "../controllers/comments.controller.js";
import {
  getOriginalPostId,
  validatePostId,
} from "../middlewares/posts.middleware.js";

const router = express.Router();

router.get("/comments/:postId", validatePostId, getOriginalPostId, getComments);

export default router;
