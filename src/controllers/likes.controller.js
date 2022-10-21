import { checkIfPostIsLikedByUser, deleteLike, insertLike, listLikes } from "../repositories/likes.repository.js";

async function likePost (req, res) {
    const { postId, userId } = res.locals;

    try {
        const likeCheck = (await checkIfPostIsLikedByUser(postId, userId));
        if (likeCheck.rowCount) return res.status(409).send("Post already liked by this user");

        await insertLike(postId, userId);

        return res.sendStatus(201);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function unlikePost (req, res) {
    const { postId, userId } = res.locals;

    try {
        const likeCheck = (await checkIfPostIsLikedByUser(postId, userId));
        if (!likeCheck.rowCount) return res.status(404).send("Like not found");

        await deleteLike(likeCheck.rows[0].id);

        return res.sendStatus(202);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function listPostLikes (req, res) {
    const { postId } = res.locals;

    try {
        const postLikes = (await listLikes(postId)).rows;

        res.status(200).send(postLikes);
    } catch (error) {
        res.status(500).send(error);
    }

}

export { likePost, unlikePost, listPostLikes };