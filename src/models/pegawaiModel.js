const prisma = require("../config/database");
const hashPassword = require("../utils/hashPassword");

const findAllPegawai = async () => {
  const pegawais = await prisma.pegawai.findMany();

  return pegawais;
};

const findPegawaiById = async (id_pegawai) => {
  const pegawai = await prisma.pegawai.findUnique({
    where: {
      id_pegawai,
    },
  });

  return pegawai;
};

const createPegawai = async (pegawai) => {
  pegawai.password = hashPassword(pegawai.password);
  const createPegawai = await prisma.pegawai.create({
    data: pegawai,
  });

  return createPegawai;
};

const updatePegawai = async (id_pegawai, pegawai) => {
  const updatePegawai = await prisma.pegawai.update({
    where: {
      id_pegawai,
    },
    data: pegawai,
  });

  return updatePegawai;
};

const deletePegawai = async (id_pegawai) => {
  const pegawai = await prisma.pegawai.delete({
    where: {
      id_pegawai,
    },
  });

  return pegawai;
};

module.exports = {
  findAllPegawai,
  findPegawaiById,
  createPegawai,
  updatePegawai,
  deletePegawai,
};
