import express from 'express';
import { listTrends, listTrendPosts, listPostTrends } from '../controllers/trends.controller.js';
import { validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.get('/hashtags', listTrends);
router.get('/hashtags/:postId', validatePostId, listPostTrends);
router.get('/hashtag/:hashtag', listTrendPosts);

export default router;