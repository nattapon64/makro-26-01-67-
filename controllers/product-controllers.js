
exports.getAllProduct = (req, res, next) => {
    res.json({ message : "Get All Products" })
}
exports.getProduct = (req, res, next) => {
    res.json({ message : "Get All Detail" })
}
exports.createProduct = (req, res, next) => {
    res.status(201).json({ message : "Create Product" })
}
exports.updateProduct = (req, res, next) => {
    res.status(201).json({ message : "Update Product" })
}
exports.deleteProduct = (req, res, next) => {
    res.status(204).json({ message : "Delete Product" })
}