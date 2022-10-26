import express from 'express';
import { postsByUser, allPosts } from '../controllers/posts.controller.js';
import { getUserDataByOriginalPostId, searchUser } from '../controllers/users.controller.js';
import { getOriginalPostId, validatePostId } from '../middlewares/posts.middleware.js';

const router = express.Router();

router.get('/user/:id', postsByUser);
router.get('/timeline', allPosts);
router.get('/user/search/:search', searchUser);
router.get('/userdata/:postId', validatePostId, getOriginalPostId, getUserDataByOriginalPostId);

export default router;