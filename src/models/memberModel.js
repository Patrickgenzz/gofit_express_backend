const prisma = require("../config/database");
const hashPassword = require("../utils/hashPassword");

const findAllMember = async () => {
  const members = await prisma.member.findMany();

  return members;
};

const findMemberById = async (id_member) => {
  const member = await prisma.member.findUnique({
    where: {
      id_member,
    },
  });

  return member;
};

const createMember = async (member) => {
  member.password = hashPassword(member.password);
  const createMember = await prisma.member.create({
    data: member,
  });

  return createMember;
};

const updateMember = async (id_member, member) => {
  const updateMember = await prisma.member.update({
    where: {
      id_member,
    },
    data: member,
  });

  return updateMember;
};

const deleteMember = async (id_member) => {
  const deleteMember = await prisma.member.delete({
    where: {
      id_member,
    },
  });

  return deleteMember;
};

module.exports = {
  findAllMember,
  findMemberById,
  createMember,
  updateMember,
  deleteMember,
};
