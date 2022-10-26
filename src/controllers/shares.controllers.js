import { STATUS_CODE } from "../enums/statusCode.js";
import { getPostById } from "../repositories/likes.repository.js";
import { insertPostData } from "../repositories/posts.repository.js";
import { getTotalPostSharesByPostId } from "../repositories/shares.repository.js";
import { getPostTrendsByPostId } from "../repositories/trends.repository.js";

async function sharePost (req, res) {
    const { postId, userId } = res.locals;

    try {
        const postData = (await getPostById(postId)).rows[0];

        let postTrends = (await getPostTrendsByPostId(postId)).rows;
        postTrends = postTrends.map(trendObj => trendObj.name);

        await insertPostData(userId, postData.link, postData.description, postTrends, postId)

        return res.sendStatus(STATUS_CODE.CREATED);   
    } catch (error) {
        return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);
    }
}

async function getTotalPostShares (req, res) {
    const { postId } = res.locals;

    try {
        const totalShares = (await getTotalPostSharesByPostId(postId)).rows[0].totalShares;

        return res.status(STATUS_CODE.OK).send(totalShares);
    } catch (error) {
        return res.status(STATUS_CODE.SERVER_ERROR).send(error.message);        
    }
}

export { sharePost, getTotalPostShares }