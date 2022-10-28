import connection from "../db/db.js";

function getUserById(id) {
  return connection.query(`SELECT * FROM users WHERE id = $1;`, [id]);
}

function getPostsByUser(userId) {
  return connection.query(
    `
      SELECT               
        posts.*, users.username, users.picture as "userPhoto", COUNT(likes.id) AS likes
      FROM
        posts
      JOIN users ON posts."userId" = users.id
        LEFT JOIN likes ON likes."postId" = posts.id
      WHERE users.id = $1
      GROUP BY posts.id, users.username, users.picture;
    `,
    [userId]
  );
}

function getAllFollowingUsers({ userId }) {
  return connection.query(
    `
        SELECT 
            * 
        FROM 
            follows 
        WHERE 
            "followerId" = $1;
    `,
    [userId]
  );
}

function getAllPosts({ userId, number }) {
  return connection.query(
    `
        SELECT 
            posts.*, users.username, users.picture as "userPhoto", COUNT(likes.id) AS likes
        FROM 
            posts
        JOIN 
            follows ON "userId" = "followedId"
        JOIN 
            users ON posts."userId" = users.id
        LEFT JOIN 
            likes ON likes."postId" = posts.id
        WHERE 
            "followerId" = $1
        GROUP BY 
            posts.id, users.username, users.picture
        ORDER BY 
            posts.id DESC LIMIT $2;
    `,
    [userId, number * 10]
  );
}

function getQuantPosts(userId) {
  return connection.query(
    `
      SELECT 
        COUNT(posts.id) As quant
      FROM 
        posts
      JOIN 
        follows ON "userId" = "followedId"
      JOIN 
        users ON posts."userId" = users.id
      LEFT JOIN 
        likes ON likes."postId" = posts.id
      WHERE 
        "followerId" = $1
    `,
    [userId]
  );
}

function getUsersBySearch(search) {
  return connection.query(
    `SELECT * FROM users WHERE LOWER(username) LIKE $1;`,
    [search.toLowerCase() + "%"]
  );
}

function getUserDataByPostId(postId) {
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

export {
  getUserById,
  getPostsByUser,
  getAllPosts,
  getUsersBySearch,
  getQuantPosts,
  getAllFollowingUsers,
  getUserDataByPostId,
};
