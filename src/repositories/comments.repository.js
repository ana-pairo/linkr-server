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
};

function postCommentsByPostId (postId, userId, description){
  return connection.query(
    `
      INSERT INTO comments
        ("postId", "userId", description)
      VALUES
        ($1, $2, $3);
    `,[postId, userId, description]
  );
};


export { getTotalPostCommentsByPostId, postCommentsByPostId };
