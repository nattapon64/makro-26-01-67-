
const joi = require("joi");

exports.createProductSchema = joi.object({
  pro_stock: joi.number(),
  pro_unit: joi.number(),
  pro_priceHigh: joi.number().required(),
  pro_minPriceHigh: joi.number().required(),
  pro_priceMedium: joi.number(),
  pro_minPriceMedium: joi.number(),
  pro_priceLow: joi.number(),
  pro_minPriceLow: joi.number(),
  pro_detail: joi.string().required(),
  pro_width: joi.number().required(),
  pro_height: joi.number().required(),
  pro_depth: joi.number().required(),
  pro_weight: joi.number().required(),
  Bra_id: joi.number().required().strip(),
  Cat_id: joi.number().required().strip(),
});
