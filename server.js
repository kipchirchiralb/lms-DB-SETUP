// express - a framework for building web servers/apis in node.js
// setting up
const express = require("express");
const mysql = require("mysql2");
const app = express();
const dbconn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "tendamema",
  database: "lms",
});
// the app intself / routes / paths / endpoints 
app.get("/students", (req, res) => {
  dbconn.query("SELECT * FROM students", (err, results) => {
    if (err) {
      console.error(err);
      res.status(500).send("Error fetching students");
    } else {
      res.render("students.ejs", { students: results });
    }
  });
});
app.get("/courses", (req, res) => {
  dbconn.query("SELECT * FROM courses", (err, results) => {
    if (err) {
      res.status(500).send("Error fetching courses");
    } else {
      res.render("courses.ejs", { courses: results });
    }
  });
});

app.get("/enrollments", (req, res) => {
  dbconn.query("SELECT * FROM enrollments", (err, results) => {
    if (err) {
      res.status(500).send("Error fetching enrollments");
    } else {
      res.render("enrollments.ejs", { enrollments: results });
    }
  });
});

    






// running the app
app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
