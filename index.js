
require("dotenv").config();

const express = require("express");
const web = express();
web.use(express.json());

const port = process.env.PORT;

web.listen("8000", () => {
    console.log("Server is running on port " + port + ` URL : http://localhost:${port}/`);
});

const productRoute = require("./routes/product-route");
const errorHandler = require("./middleware/error");
const notFoundHandler = require("./middleware/not-found");
const cors = require("cors");
const authRouter = require("./routes/auth.route");
const authenticate = require("./middleware/authenticate");
const admin = require("./middleware/admin");
const adminRoute = require("./routes/admin-route")

web.use(cors());

web.use("/auth", authRouter);
web.use("/product", productRoute);
web.use("/admin", authenticate, admin, adminRoute);

web.use(errorHandler);
web.use("*", notFoundHandler)