import express from 'express';
import { postsByUser, allPosts } from '../controllers/posts.controller.js';

const router = express.Router();

router.get('/user/:id', postsByUser);
router.get('/timeline', allPosts);

export default router;