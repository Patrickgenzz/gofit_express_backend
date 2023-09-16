const express = require("express");
const router = express.Router();
const pegawaiService = require("../services/pegawaiService");

//get all pegawai
router.get("/", async (req, res, next) => {
  try {
    const pegawais = await pegawaiService.getAllPegawai();

    res.status(200).json({
      status: "success",
      data: pegawais,
    });
  } catch (error) {
    next(error);
  }
});

//get pegawai by id
router.get("/:id", async (req, res, next) => {
  try {
    const pegawai = await pegawaiService.getPegawaiById(req.params.id);

    res.status(200).json({
      status: "success",
      data: pegawai,
    });
  } catch (error) {
    next(error);
  }
});

//create pegawai
router.post("/", async (req, res, next) => {
  try {
    const pegawai = await pegawaiService.createPegawai(req.body);

    res.status(201).json({
      status: "success",
      data: pegawai,
    });
  } catch (error) {
    next(error);
  }
});

//update pegawai
router.put("/:id", async (req, res, next) => {
  try {
    const pegawai = await pegawaiService.updatePegawai(req.params.id, req.body);

    res.status(201).json({
      status: "success",
      data: pegawai,
    });
  } catch (error) {
    next(error);
  }
});

//delete pegawai
router.delete("/:id", async (req, res, next) => {
  try {
    const pegawai = await pegawaiService.deletePegawai(req.params.id);

    res.status(201).json({
      status: "success",
      data: pegawai,
    });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
