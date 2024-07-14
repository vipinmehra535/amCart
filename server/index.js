const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.listen(1000, () => {
  console.log("Server started on port 3000");
});

initilzed = true