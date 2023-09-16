const jwt = require("jsonwebtoken");

const generateAccessToken = (user) => {
  return jwt.sign(user, process.env.SECRET_TOKEN, { expiresIn: "1h" });
};

module.exports = generateAccessToken;
