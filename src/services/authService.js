const brycpt = require("bcrypt");
const authModel = require("../models/authModel");
const CustomError = require("../utils/customError");

const loginUser = async (user) => {
  const loginUser = await authModel.findUserByEmail(user.email);

  if (!loginUser) {
    throw new CustomError("Email Not Found!", 404);
  }

  if (!(await brycpt.compare(user.password, loginUser.password))) {
    throw new CustomError("Wrong Password!", 401);
  }

  return loginUser;
};

module.exports = {
  loginUser,
};
