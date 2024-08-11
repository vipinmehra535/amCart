const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },

  description: {
    type: String,
    required: true,
    trim: true,
  },

  images: [
    {
      type: String,
      required: true,
      trim: true,
    },
  ],
  quantity: {
    type: Number,
    required: true,
  },

  price: {
    type: Number,
    required: true,
  },

  category: {
    type: String,
    required: true,
  },
});

const Product = mongoose.model("product", productSchema); // Use singular form for model name

module.exports = Product;
