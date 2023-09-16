const express = require("express");
const router = express.Router();
const instrukturService = require("../services/instrukturService");

// get all instrukturs
router.get("/", async (req, res, next) => {
  try {
    const instrukturs = await instrukturService.getAllInstruktur();

    res.status(200).json({
      message: "success",
      data: instrukturs,
    });
  } catch (error) {
    next(error);
  }
});

// get instruktur by id
router.get("/:id", async (req, res, next) => {
  try {
    const instruktur = await instrukturService.getInstrukturById(req.params.id);

    res.status(200).json({
      message: "success",
      data: instruktur,
    });
  } catch (error) {
    next(error);
  }
});

//create instruktur
router.post("/", async (req, res, next) => {
  try {
    const instruktur = await instrukturService.createInstruktur(req.body);

    res.status(201).json({
      message: "success",
      data: instruktur,
    });
  } catch (error) {
    next(error);
  }
});

//update instruktur
router.put("/:id", async (req, res, next) => {
  try {
    const instruktur = await instrukturService.updateInstruktur(req.params.id, req.body);

    res.status(201).json({
      message: "success",
      data: instruktur,
    });
  } catch (error) {
    next(error);
  }
});

//delete instruktur
router.delete("/:id", async (req, res, next) => {
  try {
    const instruktur = await instrukturService.deleteInstruktur(req.params.id);

    res.status(200).json({
      message: "success",
      data: instruktur,
    });
  } catch (error) {
    next(error);
  }
});

module.exports = router;
