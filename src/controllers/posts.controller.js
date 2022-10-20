import { checkIfPostIsPostedByUser, deletePostData, updatePostData, insertPostData } from "../repositories/posts.repository.js";
import { postSchema, postUpdateSchema } from "../schemas/postSchema.js";

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

async function createPost (req, res) {
    const { link, description, trends } = req.body;
    const validation = postSchema.validate(req.body);

    if(validation.error) {
        const errors = validation.error.details.map(detail => detail.message);
        return res.status(422).send(errors);
    }

    const urlTester = new RegExp(
        '^(https?:\\/\\/)?'+'((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+'((\\d{1,3}\\.){3}\\d{1,3}))'+
	    '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+'(\\?[;&a-z\\d%_.~+=-]*)?'+'(\\#[-a-z\\d_]*)?$','i'
    );

    if(!urlTester.test(link)) {
        return res.status(422).send('URL inválida!');
    } 

    const userId = 1; //res.locals.userId;

    try {
        await insertPostData( userId, link, description, trends );

        return res.sendStatus(201);
    } catch (error) {
        res.status(500).send(error.message);
    } 
}

export {
    updatePost,
    deletePost,
    createPost
}