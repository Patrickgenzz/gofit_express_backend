const pegawaiModel = require("../models/pegawaiModel");
const authModel = require("../models/authModel");
const CustomError = require("../utils/customError");

const getAllPegawai = async () => {
  const pegawais = await pegawaiModel.findAllPegawai();

  return pegawais;
};

const getPegawaiById = async (id_pegawai) => {
  const pegawai = await pegawaiModel.findPegawaiById(id_pegawai);

  if (!pegawai) throw new CustomError("Pegawai Not Found!", 404);

  return pegawai;
};

const createPegawai = async (pegawai) => {
  const user = await authModel.findUserByEmail(pegawai.email);

  if (user) throw new CustomError("Email Already Exist!", 400);

  const newPegawai = await pegawaiModel.createPegawai(pegawai);

  return newPegawai;
};

const updatePegawai = async (id_pegawai, pegawai) => {
  await getPegawaiById(id_pegawai);
  const updatePegawai = await pegawaiModel.updatePegawai(id_pegawai, pegawai);

  return updatePegawai;
};

const deletePegawai = async (id_pegawai) => {
  await getPegawaiById(id_pegawai);
  const deletePegawai = await pegawaiModel.deletePegawai(id_pegawai);

  return deletePegawai;
};

module.exports = {
  getAllPegawai,
  getPegawaiById,
  createPegawai,
  updatePegawai,
  deletePegawai,
};
