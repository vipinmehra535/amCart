const express = require("express");
const adminRouter = express.Router();
const admin = require("../middleware/admin");
const Product = require("../models/product");

// Add Products

adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, images, category, quantity, price } = req.body;
    let product = new Product({
      name,
      description,
      images,
      category,
      quantity,
      price,
    });

    product = await product.save();
    res.json(product);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = adminRouter;
