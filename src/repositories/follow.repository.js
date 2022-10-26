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

export { checkUsers, isFollowing, insertFollow, deleteFollow };
