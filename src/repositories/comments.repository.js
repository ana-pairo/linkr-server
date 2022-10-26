import connection from "../db/db.js";

function getTotalPostCommentsByPostId(postId) {
  return connection.query(
    `
      SELECT 
        comments.*, 
        users.username, 
        users.picture 
      FROM 
        comments 
      JOIN 
        users 
      ON 
        comments."userId" = users.id 
      WHERE "postId" = $1;

    `,
    [postId]
  );
}

export { getTotalPostCommentsByPostId };
