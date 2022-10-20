import express from 'express';
import { postsByUser } from '../controllers/posts.controller.js';

const router = express.Router();

router.get('/user/:id', postsByUser);

export default router;