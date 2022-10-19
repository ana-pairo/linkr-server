import express from 'express';
import { deletePost, updatePost } from '../controllers/posts.controller.js';
import { validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.patch('/post/:postId', validatePostId, updatePost);
router.delete('/post/:postId', validatePostId, deletePost);

export default router;