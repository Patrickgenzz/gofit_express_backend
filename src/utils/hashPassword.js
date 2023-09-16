const brycpt = require("bcrypt");

const hashPassword = (password) => {
  return brycpt.hashSync(password, 10);
};

module.exports = hashPassword;
