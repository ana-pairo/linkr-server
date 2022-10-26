import express from 'express';
import { likePost, listPostLikes, unlikePost } from '../controllers/likes.controller.js';
import { getOriginalPostId, validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.get('/like/:postId', validatePostId, getOriginalPostId, likePost);
router.delete('/like/:postId', validatePostId, getOriginalPostId, unlikePost);
router.get('/likes/:postId', validatePostId, getOriginalPostId, listPostLikes);

export default router;