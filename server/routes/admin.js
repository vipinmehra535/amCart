const express = require("express");
const adminRouter = express.Router();
const admin = require("../middleware/admin");

// Add Products

adminRouter.get("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, images, category, quantity, price } = req.body;
    res.json(products);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;
