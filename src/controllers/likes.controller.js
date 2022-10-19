import connection from "../db/db.js";

async function likePost (req, res) {

}

async function unlikePost (req, res) {

}

async function listPostLikes (req, res) {
    const { postId } = req.params;

    try {
        const postLikes = (await connection.query(
            `
                SELECT 
                    COUNT(likes.id) AS "totalLikes", users.name AS username 
                FROM 
                    likes
                JOIN users ON likes."userId" = users.id
                WHERE likes."postId" = $1
                GROUP BY users.name;
            `,
            [postId]
        )).rows;

        res.status(200).send(postLikes);
    } catch (error) {
        res.status(500).send(error);
    }

}

export { likePost, unlikePost, listPostLikes };