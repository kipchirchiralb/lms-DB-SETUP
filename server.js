// express - a framework for building web servers/apis in node.js
const express = require('express');
const mysql = require('mysql2');
const app = express();
const dbconn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'tendamema',
    database: 'lms'
});
app.get("/students", (req, res) => {
    dbconn.query("SELECT * FROM students", (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).send("Error fetching students");
        }else{
            res.json(results);
        }
    });
});
app.listen(3000, () => {
    console.log("Server is running on port 3000");
});
