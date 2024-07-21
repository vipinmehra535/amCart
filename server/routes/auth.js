const express = require("express");
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");

const User = require("../models/user");

// Signup route
authRouter.post("/api/signup", async (req, res) => {
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

authRouter.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ msg: "Please provide email and password" });
    }
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "User does not exist" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Invalid credentials" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
    console.log(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = authRouter;
