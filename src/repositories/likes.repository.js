import connection from "../db/db.js";

function getPostById (postId) {
    return connection.query(
        `
            SELECT
                *
            FROM
                posts
            WHERE id = $1;  
        `,
        [postId]
    );
}

function checkIfPostIsLikedByUser (postId, userId) {
    return connection.query(
        `
            SELECT
                id
            FROM
                likes
            WHERE "postId" = $1 AND "userId" = $2;
        `,
        [postId, userId]
    );
}

function insertLike (postId, userId) {
    return connection.query(
        `
            INSERT INTO
                likes
            ("postId", "userId") VALUES ($1, $2);
        `,
        [postId, userId]
    );
}

function deleteLike (likeId) {
    return connection.query(
        `
            DELETE FROM
                likes
            WHERE id = $1;
        `,
        [likeId]
    );
}

function listLikes (postId) {
    return connection.query(
        `
            SELECT 
                users.username, users.id as "userId"
            FROM 
                likes
            JOIN users ON likes."userId" = users.id
            WHERE likes."postId" = $1
            GROUP BY users.username;
        `,
        [postId]
    );
}

export { getPostById, checkIfPostIsLikedByUser, insertLike, deleteLike, listLikes };