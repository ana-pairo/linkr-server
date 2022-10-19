import { checkIfPostIsPostedByUser, deletePostData, updatePostData } from "../repositories/posts.repository.js";
import Joi from 'joi';

const postUpdateSchema = Joi.object({
    newDescription: Joi.string().required(),
    newTrends: Joi.array().items(Joi.string()).required(),
})

async function updatePost (req, res) {
    const validation = postUpdateSchema.validate(req.body, { abortEarly: false });
    if (validation.error) {
        const errors = validation.error.details.map(detail => detail.message);
        return res.status(422).send(errors);
    }
    
    const { postId } = res.locals;
    const userId = 1; //TODO: Change to res.locals after authentication implementing middleware
    const { newDescription, newTrends } = req.body;

    try {
        const postCheck = (await checkIfPostIsPostedByUser(postId, userId));
        if (!postCheck.rowCount) return res.status(401).send("Post not made by user");

        await updatePostData(postCheck.rows[0].id, newDescription, newTrends);

        return res.sendStatus(204);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function deletePost (req, res) {
    const { postId } = res.locals;
    const userId = 1; //TODO: Change to res.locals after authentication implementing middleware

    try {
        const postCheck = (await checkIfPostIsPostedByUser(postId, userId));
        if (!postCheck.rowCount) return res.status(401).send("Post not made by user");

        await deletePostData(postCheck.rows[0].id);

        return res.sendStatus(202);
    } catch (error) {
        return res.status(500).send(error);
    }
}

export {
    updatePost,
    deletePost,
}