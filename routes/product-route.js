
const express = require("express");
const productControllers = require("../controllers/product-controllers");
const authenticate = require("../middleware/authenticate")
const router = express.Router();

router.get("/", productControllers.getAllProduct);
router.get("/:id", productControllers.getProduct);
router.post("/", productControllers.createProduct);
router.put("/:id", productControllers.updateProduct);
router.delete("/:id", productControllers.deleteProduct);
module.exports = router;