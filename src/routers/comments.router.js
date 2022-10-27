import express from "express";
import { getComments, postComments } from "../controllers/comments.controller.js";
import {
  getOriginalPostId,
  validatePostId,
} from "../middlewares/posts.middleware.js";

const router = express.Router();

router.post("/comments/:postId", validatePostId, getOriginalPostId, postComments);
router.get("/comments/:postId", validatePostId, getOriginalPostId, getComments);

export default router;
