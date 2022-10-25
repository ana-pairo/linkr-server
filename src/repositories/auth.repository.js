import connection from "../db/db.js";

async function checkIfEmailIsValid({ email }) {
  return connection.query(
    `
      SELECT 
          *
      FROM 
          users 
      WHERE 
          email = $1;
    `,
    [email]
  );
}

async function checkIfNameIsValid({ username }) {
  return connection.query(
    `
      SELECT 
          *
      FROM 
          users 
      WHERE 
          username = $1;
    `,
    [username]
  );
}

async function insertUser({ username, email, passwordHash, picture }) {
  return connection.query(
    `
      INSERT INTO
          users
      (username, email, password, picture) VALUES ($1, $2, $3, $4);
    `,
    [username, email, passwordHash, picture]
  );
}

async function openSession({ token, userId }) {
  return connection.query(
    `
      INSERT INTO
        sessions ("userId", token)
      VALUES
        ($1, $2);
    `,
    [userId, token]
  );
}

export { checkIfEmailIsValid, insertUser, openSession, checkIfNameIsValid };
