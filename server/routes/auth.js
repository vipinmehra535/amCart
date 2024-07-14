const express = require("express");
const router = express.Router();

router.post("/api/signup", (req, res) => {
  const { name, email, password } = req.body;
  console.log(req.body);
});
module.exports = router;
