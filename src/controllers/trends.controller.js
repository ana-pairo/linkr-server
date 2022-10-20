import { getTrends, getHashtagId, getTrendPostsByTrendId, getPostTrendsByPostId } from "../repositories/trends.repository.js";

async function listTrends (req, res) {
    try {
        const trends = (await getTrends()).rows;

        return res.status(200).send(trends);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function listTrendPosts (req, res) {
    const { hashtag } = req.params;

    try {
        const trend = (await getHashtagId(hashtag)).rows;
        if (!trend.length) return res.status(404).send('Trend not found');
        console.log(trend)

        const trendPosts = (await getTrendPostsByTrendId(trend[0].id)).rows;

        return res.status(200).send(trendPosts);
    } catch (error) {
        return res.status(500).send(error);
    }
}

async function listPostTrends (req, res) {
    const { postId } = res.locals;

    try {
        const postTrends = (await getPostTrendsByPostId(postId)).rows;

        return res.status(200).send(postTrends);
    } catch (error) {
        return res.status(500).send(error);
    }
}

export {
    listTrends,
    listTrendPosts,
    listPostTrends
}