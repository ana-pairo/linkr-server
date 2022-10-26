import express from 'express';
import { getUserDataByOriginalPostId, searchUser } from '../controllers/users.controller.js';
import { getOriginalPostId, validatePostId } from '../middlewares/posts.middleware.js';
import { postsByUser, allPosts, quantPosts } from '../controllers/posts.controller.js';

const router = express.Router();

router.get('/user/:id', postsByUser);
router.get('/timeline/:number', allPosts);
router.get('/user/search/:search', searchUser);
router.get('/userdata/:postId', validatePostId, getOriginalPostId, getUserDataByOriginalPostId);
router.get('/quant', quantPosts);

export default router;