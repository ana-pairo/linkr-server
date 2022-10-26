import connection from "../db/db.js";

function getTotalPostCommentsByPostId(postId) {
  return connection.query(
    `
            SELECT COUNT(id) AS "totalComments" FROM comments WHERE "postId" = $1;
        `,
    [postId]
  );
}

export { getTotalPostCommentsByPostId };
