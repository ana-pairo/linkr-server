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

export { checkIfPostIsPostedByUser, deletePostData, updatePostData }