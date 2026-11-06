import mysql from "mysql2";

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: " ",
    database: "praktikum5",
});

db.connect((err) => {
    if (err) console.error("Database Connection failed: ", err.message);
    else console.log("Connected to MySQL Database.");
});

export default db;