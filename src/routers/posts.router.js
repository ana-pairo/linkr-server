import express from 'express';
import { deletePost, updatePost, createPost } from '../controllers/posts.controller.js';
import { authMiddleware } from '../middlewares/auth.middleware.js';
import { validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.use(authMiddleware);

router.patch('/post/:postId', validatePostId, updatePost);
router.delete('/post/:postId', validatePostId, deletePost);
router.post('/post', createPost);

export default router;