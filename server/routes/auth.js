const express = require("express");
const router = express.Router();
const bcryptjs = require("bcryptjs");

const User = require("../models/user");

// Signup route
router.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
      return res.status(400).json({ msg: "Please provide all details" });
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "User already exists" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);
    const user = await User.create({ name, email, password: hashedPassword });
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
