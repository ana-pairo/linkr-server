import express from 'express';
import { postsByUser, allPosts } from '../controllers/posts.controller.js';
import { searchUser } from '../controllers/users.controller.js';
import { authMiddleware } from '../middlewares/auth.middleware.js';

const router = express.Router();

router.use(authMiddleware);

router.get('/user/:id', postsByUser);
router.get('/timeline', allPosts);
router.post('/user/search/:search', searchUser);

export default router;