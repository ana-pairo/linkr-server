import connection from "../db/db.js";

function getTrends () {
    return connection.query(`SELECT * FROM trends;`);
}

export {
    getTrends,
}