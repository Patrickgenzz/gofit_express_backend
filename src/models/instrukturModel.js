const prisma = require("../config/database");
const hashPassword = require("../utils/hashPassword");

const findAllInstruktur = async () => {
  const instrukturs = await prisma.instruktur.findMany();

  return instrukturs;
};

const findInstrukturById = async (id_instruktur) => {
  const instruktur = await prisma.instruktur.findUnique({
    where: {
      id_instruktur,
    },
  });

  return instruktur;
};

const createInstruktur = async (instruktur) => {
  instruktur.password = hashPassword(instruktur.password);
  const createInstruktur = await prisma.instruktur.create({
    data: instruktur,
  });

  return createInstruktur;
};

const updateInstruktur = async (id_instruktur, instruktur) => {
  const updateInstruktur = await prisma.instruktur.update({
    where: {
      id_instruktur,
    },
    data: instruktur,
  });

  return updateInstruktur;
};

const deleteInstruktur = async (id_instruktur) => {
  const deleteInstruktur = await prisma.instruktur.delete({
    where: {
      id_instruktur,
    },
  });

  return deleteInstruktur;
};

module.exports = {
  findAllInstruktur,
  findInstrukturById,
  createInstruktur,
  updateInstruktur,
  deleteInstruktur,
};
