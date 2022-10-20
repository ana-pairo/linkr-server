import express from 'express';
import { likePost, listPostLikes, unlikePost } from '../controllers/likes.controller.js';
import { authMiddleware } from '../middlewares/auth.middleware.js';
import { validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.use(authMiddleware);

router.get('/like/:postId', validatePostId, likePost);
router.delete('/like/:postId', validatePostId, unlikePost);
router.get('/likes/:postId', validatePostId, listPostLikes);

export default router;