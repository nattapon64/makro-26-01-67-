
const express = require("express");
const router = express.Router();
const adminController = require("../controllers/admin-controller");
const upload = require("../middleware/upload");


router.post("/product", upload.array("image", 5), adminController.createProduct)

router.post("/product", adminController.createProduct);

router.patch("/product/:productId", adminController.updateProduct);

router.post("/category", adminController.createCategory);

router.post("/brand", adminController.createBrand);

router.post("/promotion", adminController.createPromotion);

module.exports = router;
