
const createError = require("../utils/createError");
const prisma = require("../config/prisma");
const bcrypt = require("bcryptjs");
const userService = require("../services/user-service");
const jwt = require("jsonwebtoken");

exports.register = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return createError(400, "Email and password are required");
    }


    if (typeof email !== "string" || typeof password !== "string") {
      return createError(400, "Email and password invalid");
    }

    const isUserExist = await userService.getUserByEmail(email);

    if (isUserExist) {
      return createError(400, "User already exist");
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    await userService.createUser(email, hashedPassword);

    res.json({ message: "Register Success" });
  } catch (err) {
    next(err);
  }
};

exports.login = async (req, res, next) => {
  try {
    const { email, password } = req.body;

    if (!email || !password) {
      return createError(400, "Email and Password are required");
    }

    if (typeof email !== "string" || typeof password !== "string") {
      return createError(400, "Email or password is invalid");
    }

    const isUserExist = await userService.getUserByEmail(email);

    if (!isUserExist) {
      return createError(400, "Email or password is invalid");
    }

    const isPasswordMatch = bcrypt.compare(password, isUserExist.user_password);

    if (!isPasswordMatch) {
      return createError(400, "Email or password is invalid");
    }

    const token = jwt.sign({ id: isUserExist.user_id }, process.env.JWT_SECRET, {
      expiresIn: process.env.JWT_EXPIRES_IN,
    });

    res.json({ token })

  } catch (err) {
    next(err);
  }
};

exports.forgetPassword = (req, res, next) => {
  const { email } = req.body;
  res.json({ email });
};

exports.varifyForgetPassword = (req, res, next) => {
  const { token } = req.params;
  res.json({ token });
};

exports.resetPassword = (req, res, next) => {
  const { token } = req.params;
  const { password } = req.body;
  res.json({ token, password });
};
