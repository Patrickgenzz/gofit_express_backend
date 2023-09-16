const express = require("express");
const router = express.Router();
const memberService = require("../services/memberService");

// get all members
router.get("/", async (req, res, next) => {
  try {
    const members = await memberService.getAllMember();

    res.status(200).json({
      message: "success",
      data: members,
    });
  } catch (error) {
    next(error);
  }
});

// get member by id
router.get("/:id", async (req, res, next) => {
  try {
    const member = await memberService.getMemberById(req.params.id);

    res.status(200).json({
      message: "success",
      data: member,
    });
  } catch (error) {
    next(error);
  }
});

//create member
router.post("/", async (req, res, next) => {
  try {
    const member = await memberService.createMember(req.body);

    res.status(201).json({
      message: "success",
      data: member,
    });
  } catch (error) {
    next(error);
  }
});

//update member
router.put("/:id", async (req, res, next) => {
  try {
    const member = await memberService.updateMember(req.params.id, req.body);

    res.status(201).json({
      message: "success",
      data: member,
    });
  } catch (error) {
    next(error);
  }
});

//delete member
router.delete("/:id", async (req, res, next) => {
  try {
    const member = await memberService.deleteMember(req.params.id);

    res.status(200).json({
      message: "success",
      data: member,
    });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
