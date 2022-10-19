import express from 'express';
import { likePost, listPostLikes, unlikePost } from '../controllers/likes.controller.js';
import { validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.get('/like/:postId', validatePostId, likePost);
router.delete('/like/:postId', validatePostId, unlikePost);
router.get('/likes/:postId', validatePostId, listPostLikes);

export default router;