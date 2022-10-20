import connection from "../db/db.js";

async function checkIfEmailIsRepited({ email }) {
  return connection.query(
    `
      SELECT 
          id 
      FROM 
          users 
      WHERE 
          email = $1;
    `,
    [email]
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

export { checkIfEmailIsRepited, insertUser };
