import connection from "../db/db.js";

function getTrends () {
    return connection.query(
        `
            SELECT 
                posts_trends."trendId" AS id, trends.name, COUNT(posts_trends."trendId") AS quant 
            FROM 
                posts_trends 
            JOIN trends ON "trendId" = trends.id
            GROUP BY posts_trends."trendId", trends.name 
            ORDER BY quant DESC;
        `
    );
}

function getHashtagId (hashtag) {
    return connection.query(
        `
            SELECT
                id
            FROM
                trends
            WHERE name = $1;
        `,
        [hashtag]
    );
}

function getTrendPostsByTrendId (hashtagId) {
    return connection.query(
        `
            SELECT               
                posts.*, users.username, users.picture as "userPhoto", COUNT(likes.id) AS likes
            FROM
                posts_trends
            JOIN posts ON posts_trends."postId" = posts.id
            JOIN users ON posts."userId" = users.id
            LEFT JOIN likes ON likes."postId" = posts.id
            WHERE posts_trends."trendId" = $1
            GROUP BY posts.id, users.username, users.picture LIMIT 20;
        `,
        [hashtagId]
    );
}

function getPostTrendsByPostId (postId) {
    return connection.query(
        `
            SELECT
                trends.*
            FROM
                posts_trends
            JOIN trends ON posts_trends."trendId" = trends.id
            WHERE posts_trends."postId" = $1;
        `,
        [postId]
    );
}

export {
    getTrends,
    getHashtagId,
    getTrendPostsByTrendId,
    getPostTrendsByPostId
}
