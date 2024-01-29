const prisma = require("../config/prisma");

exports.getUserById = (id) => {
  return prisma.user.findFirst({
    where: {
      user_id: id,
    },
  });
};

exports.getUserByEmail = (email) => {
  return prisma.user.findFirst({
    where: {
      user_email: email,
    },
  });
};

exports.createUser = (email, password) => {
  return prisma.user.create({
    data: {
      user_email: email,
      user_password: password,
    },
  });
};
