import connection from "../db/db.js";

function getUserById (id) {
    return connection.query(
        `SELECT * FROM users WHERE id = $1;`,
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
            GROUP BY posts.id, users.username, users.picture LIMIT 20;
        `,
        [userId]
    );
}

function getAllPosts (number) {
    return connection.query(
        `
            SELECT
            posts.*, users.username, users.picture as "userPhoto", COUNT(likes.id) AS likes
            FROM
            posts
            JOIN users ON posts."userId" = users.id
            LEFT JOIN likes ON likes."postId" = posts.id
            GROUP BY posts.id, users.username, users.picture
            ORDER BY id DESC LIMIT $1;
        `,
        [number*10]
    );
}

function getQuantPosts () { // Ana... Tem q mudar aqui tbm :)
    return connection.query(
        `
        SELECT               
        COUNT(posts.id) As quant
        FROM
        posts
        JOIN users ON posts."userId" = users.id
        LEFT JOIN likes ON likes."postId" = posts.id;
        `
    );
}


function getUsersBySearch (search) {
    return connection.query(
        `SELECT * FROM users WHERE LOWER(username) LIKE $1;`,
        [search.toLowerCase()+"%"]
    );
}

function getUserDataByPostId (postId) {
    return connection.query(
        `
            SELECT 
                users.username, users.picture
            FROM
                users
            JOIN posts ON posts."userId" = users.id
            WHERE posts.id = $1;
        `,
        [postId]
    );
}

export { getUserById, getPostsByUser, getAllPosts, getUsersBySearch, getUserDataByPostId, getQuantPosts };
