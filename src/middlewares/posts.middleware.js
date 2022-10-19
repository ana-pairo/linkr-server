import { getPostById } from "../repositories/likes.repository.js";

async function validatePostId (req, res, next) {
    const { postId } = req.params;

    try {
        const postExists = (await getPostById(postId)).rows;
        if (!postExists.length) return res.status(404).send('Post does not exist');

        res.locals.postId = postExists[0].id;

        next();
    } catch (error) {
        return res.status(500).send(error);
    }
}

export { validatePostId };