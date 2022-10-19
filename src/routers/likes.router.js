import express from 'express';
import { likePost, listPostLikes, unlikePost } from '../controllers/likes.controller.js';

const router = express.Router();

router.get('/like/:postId', likePost);
router.delete('/like/:postId', unlikePost);
router.get('/likes/:postId', listPostLikes);

export default router;