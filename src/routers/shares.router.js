import express from 'express';
import { getTotalPostShares, sharePost } from '../controllers/shares.controllers.js';
import { getOriginalPostId, validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.get('/shares/:postId', validatePostId, getOriginalPostId, getTotalPostShares);
router.get('/share/:postId', validatePostId, getOriginalPostId, sharePost);

export default router;