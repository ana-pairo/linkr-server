import express from 'express';
import { listTrends } from '../controllers/trends.controller.js';

const router = express.Router();

router.get('/hashtags', listTrends);
router.get('/hashtags/:postId');
router.get('/hashtag/:hashtag');

export default router;