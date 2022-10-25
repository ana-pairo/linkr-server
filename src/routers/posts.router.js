import express from 'express';
import { deletePost, updatePost, createPost, sharePost } from '../controllers/posts.controller.js';
import { validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.post('/post', createPost);
router.patch('/post/:postId', validatePostId, updatePost);
router.delete('/post/:postId', validatePostId, deletePost);
router.get('/share/:postId', validatePostId, sharePost);

export default router;