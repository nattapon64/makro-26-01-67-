
const cloudUpload = require("../utils/cloudupload");
const prisma = require("../config/prisma");
const createError = require("../utils/createError");
const fs = require('fs');
const { createProductSchema } = require("../validator/admin-validator");

exports.createProduct = async (req, res, next) => {
   try {
  //   const {
  //     priceHigh,
  //     minPriceHigh,
  //     detail,
  //     width,
  //     height,
  //     depth,
  //     weight,
  //     brandId,
  //     categoryId,
  //   } = req.body;

    const value = await createProductSchema.validateAsync(req.body);

    const { Bra_id, Cat_id } = req.body;
  
    const product = await prisma.products.create({
      data: {
        // pro_priceHigh: Number(priceHigh),
        // pro_minPriceHigh: Number(minPriceHigh),
        // pro_detail: detail,
        // pro_width: width,
        // pro_height: height,
        // pro_depth: depth,
        // pro_weight: weight,
        ...value,
        brand: {
          connect: {
            bra_id: Number(Bra_id),
          },
        },
        category: {
          connect: {
            cat_id: Number(Cat_id),
          },
        },
        user: {
          connect: {
            user_id: req.user.user_id,
          },
        },
      },
    });

    const imagePromiseArray = req.files.map((file) => {
      return cloudUpload(file.path);
    });

    const imgUrlArray = await Promise.all(imagePromiseArray);

    const productImages = imgUrlArray.map((imgUrl) => {
      return {
        img_url: imgUrl,
        Pro_id: product.pro_id,
      };
    });

    await prisma.product_image.createMany({
      data: productImages,
    });

    const newProduct = await prisma.products.findMany({
      where: {
        pro_id: product.pro_id,
      },
      include: {
        product_image: true,
      },
    });

    res.json({ newProduct });
    
  } catch (err) {
    next(err);
  }
};

exports.updateProduct = async (req, res, next) => {
  try {
    res.json({ message: "Update Product" });
  } catch (err) {
    next(err);
  }
};

exports.createCategory = async (req, res, next) => {
  try {
    const { name, count } = req.body;
    const category = await prisma.category.create({
      data: {
        cat_name: name,
        cat_count: Number(count),
      },
    });
    res.json({ category, message: "Create Category Success" });
  } catch (err) {
    next(err);
  }
};

exports.createBrand = async (req, res, next) => {
  try {
    res.json({ message: "Create Brand" });
  } catch (err) {
    next(err);
  }
};

exports.createPromotion = async (req, res, next) => {
  try {
    res.json({ message: "Create Promotion" });
  } catch (err) {
    next(err);
  }
};
