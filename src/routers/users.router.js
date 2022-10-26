import express from 'express';
import { postsByUser, allPosts, quantPosts } from '../controllers/posts.controller.js';
import { searchUser } from '../controllers/users.controller.js';

const router = express.Router();

router.get('/user/:id', postsByUser);
router.get('/timeline/:number', allPosts);
router.get('/user/search/:search', searchUser);
router.get('/quant', quantPosts);

export default router;