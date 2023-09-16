const express = require("express");
const router = express.Router();
const authService = require("../services/authService");
const generateAccessToken = require("../utils/generateToken");

//login user
router.post("/", async (req, res, next) => {
  try {
    const user = await authService.loginUser(req.body);
    const token = generateAccessToken({ user: user.nama_user });

    res.status(200).json({
      message: "success",
      token: token,
      data: user,
    });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
