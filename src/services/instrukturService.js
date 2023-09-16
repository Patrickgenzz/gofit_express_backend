const instrukturModel = require("../models/instrukturModel");
const authModel = require("../models/authModel");
const CustomError = require("../utils/customError");

const getAllInstruktur = async () => {
  const instrukturs = await instrukturModel.findAllInstruktur();

  return instrukturs;
};

const getInstrukturById = async (id_instruktur) => {
  const instruktur = await instrukturModel.findInstrukturById(id_instruktur);

  if (!instruktur) throw new CustomError("Instruktur Not Found!", 404);

  return instruktur;
};

const createInstruktur = async (instruktur) => {
  const user = await authModel.findUserByEmail(instruktur.email);

  if (user) throw new CustomError("Email Already Exist!", 400);

  const newInstruktur = await instrukturModel.createInstruktur(instruktur);

  return newInstruktur;
};

const updateInstruktur = async (id_instruktur, instruktur) => {
  await getInstrukturById(id_instruktur);
  const updateInstruktur = await instrukturModel.updateInstruktur(id_instruktur, instruktur);

  return updateInstruktur;
};

const deleteInstruktur = async (id_instruktur) => {
  await getInstrukturById(id_instruktur);
  const deleteInstruktur = await instrukturModel.deleteInstruktur(id_instruktur);

  return deleteInstruktur;
};

module.exports = {
  getAllInstruktur,
  getInstrukturById,
  createInstruktur,
  updateInstruktur,
  deleteInstruktur,
};
