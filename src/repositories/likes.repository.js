import connection from "../db/db.js";

function listLikes (postId) {
    return connection.query(
        `
            SELECT 
                users.name AS username 
            FROM 
                likes
            JOIN users ON likes."userId" = users.id
            WHERE likes."postId" = $1
            GROUP BY users.name;
        `,
        [postId]
    );
}

export { listLikes };