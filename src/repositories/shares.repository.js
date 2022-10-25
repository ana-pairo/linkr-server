import connection from "../db/db.js";

function getTotalPostSharesByPostId (postId) {
    return connection.query(
        `
            SELECT COUNT(id) AS "totalShares" FROM posts WHERE "originalId" = $1;
        `,
        [postId]
    );
}

export { getTotalPostSharesByPostId };