import connection from "../db/db.js";

function checkIfPostIsPostedByUser (postId, userId) {
    return connection.query(
        `
            SELECT
                id
            FROM
                posts
            WHERE id = $1 AND "userId" = $2;
        `,
        [postId, userId]
    );
}

function updatePostData (postId, newDescription, newTrends) {
    updatePostDescription(postId, newDescription);
    updatePostTrends(postId, newTrends);

    return;
}

async function updatePostDescription (postId, newDescription) {
    await connection.query(
        `
            UPDATE
                posts
            SET
                description = $1
            WHERE id = $2;
        `,
        [newDescription, postId]
    );

    return;
}

async function updatePostTrends (postId, newTrends) {
    await connection.query(
        `
            DELETE FROM
                posts_trends
            WHERE "postId" = $1;
        `,
        [postId]
    );

    try {    
        for (let i = 0; i < newTrends.length; i++) {
            const trend = newTrends[i];
            let trendId = (await connection.query(
                "SELECT id FROM trends WHERE name = $1;",
                [trend]
            )).rows;
            if (!trendId.length) {
                await connection.query(
                    "INSERT INTO trends (name) VALUES ($1);",
                    [trend]
                )
                trendId = (await connection.query(
                    "SELECT id FROM trends WHERE name = $1;",
                    [trend]
                )).rows;
            }
    
            await connection.query(
                `
                    INSERT INTO 
                        posts_trends
                    ("postId", "trendId") VALUES ($1, $2);
                `,
                [postId, trendId[0].id]
            )
        }
    
        return;        
    } catch (error) {
        console.log(error.message)
    }
}

async function deletePostData (postId) {
    await connection.query(
        `
            DELETE FROM
                posts_trends
            WHERE "postId" = $1;
        `,
        [postId]
    );

    await connection.query(
        `
            DELETE FROM
                likes
            WHERE "postId" = $1;
        `,
        [postId]
    );

    await connection.query(
        `
            DELETE FROM
                posts
            WHERE id = $1;
        `,
        [postId]
    );

    return;
}

async function insertPostData ( userId, link, description, trends ) {
    const postId = await insertPost(userId, link, description);
    updatePostTrends(postId, trends);

    return;
}

async function insertPost (userId, link, description) {
    await connection.query(
        `
            INSERT INTO posts 
                (link, description, "userId") 
            VALUES 
                ($1, $2, $3);  
        `,
        [link, description, userId]
    );
    const postId = await connection.query(
        `
            SELECT MAX(id) AS max FROM posts WHERE "userId" = $1;
        `,
        [userId]
    );

    return postId.rows[0].max;
}

export { checkIfPostIsPostedByUser, deletePostData, updatePostData, insertPostData };