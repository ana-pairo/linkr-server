import connection from "../db/db.js";

async function checkUsers(id) {
  return connection.query(
    `
            SELECT
                *
            FROM
                users
            WHERE id = $1;  
        `,
    [id]
  );
}

async function isFollowing({ follower, followed }) {
  return connection.query(
    `
        SELECT
            *
        FROM
            follows
        WHERE 
            "followerId" = $1
        AND
            "followedId" = $2;  
    `,
    [follower, followed]
  );
}

async function insertFollow({ follower, followed }) {
  return connection.query(
    `
        INSERT INTO
            follows
        ("followerId", "followedId") VALUES ($1, $2); 
    `,
    [follower, followed]
  );
}

async function deleteFollow({ follower, followed }) {
  return connection.query(
    `
        DELETE FROM
            follows
        WHERE
            "followerId" = $1
        AND
            "followedId" = $2; 
    `,
    [follower, followed]
  );
}

function getFollowersIdByUser (userId){
  return connection.query(
    `
      SELECT 
        "followerId" 
        FROM 
          follows 
        WHERE "followedId" = $1;
    `,
    [userId]
  );
};

export { checkUsers, isFollowing, insertFollow, deleteFollow, getFollowersIdByUser };
