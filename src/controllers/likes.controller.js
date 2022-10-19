import { listLikes } from "../repositories/likes.repository.js";

async function likePost (req, res) {

}

async function unlikePost (req, res) {

}

async function listPostLikes (req, res) {
    const { postId } = req.params;

    try {
        const postLikes = (await listLikes(postId)).rows;

        res.status(200).send(postLikes);
    } catch (error) {
        res.status(500).send(error);
    }

}

export { likePost, unlikePost, listPostLikes };