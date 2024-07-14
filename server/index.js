const express = require("express");
const mongoose = require("mongoose");
const PORT = 8000;
const app = express();

const DB =
  "mongodb+srv://vipin:9999855768@mongodb.rcpk4rc.mongodb.net/?retryWrites=true&w=majority&appName=Mongodb";

app.get("/", (req, res) => {
  res.send("Hello World!");
});

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
