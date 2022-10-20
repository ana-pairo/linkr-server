import connection from "../db/db.js";

function getUserById (id) {
    return connection.query(
        `SELECT * FROM users WHERE id= $1;`,
        [id]
    );
}

function getPostsByUser (userId) {
    return connection.query(
        `
            SELECT               
                posts.*, users.username, users.picture as "userPhoto", COUNT(likes.id) AS likes
            FROM
                posts_trends
            JOIN posts ON posts_trends."postId" = posts.id
            JOIN users ON posts."userId" = users.id
            LEFT JOIN likes ON likes."postId" = posts.id
            WHERE users.id = $1
            GROUP BY posts.id, users.username, users.picture;
        `,
        [userId]
    );
}

function getAllPosts () {
    return connection.query(
        `
            SELECT               
                posts.*, users.username, users.picture as "userPhoto", COUNT(likes.id) AS likes
            FROM
                posts_trends
            JOIN posts ON posts_trends."postId" = posts.id
            JOIN users ON posts."userId" = users.id
            LEFT JOIN likes ON likes."postId" = posts.id
            GROUP BY posts.id, users.username, users.picture
            ORDER BY id DESC LIMIT 20;
        `
    );
}

export { getUserById, getPostsByUser, getAllPosts };