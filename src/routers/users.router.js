import express from 'express';
import { postsByUser, allPosts } from '../controllers/posts.controller.js';
import { searchUser } from '../controllers/users.controller.js';

const router = express.Router();

router.get('/user/:id', postsByUser);
router.get('/timeline', allPosts);
router.get('/user/search/:search', searchUser);

export default router;