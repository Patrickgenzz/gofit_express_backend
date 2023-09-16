const memberModel = require("../models/memberModel");
const authModel = require("../models/authModel");
const CustomError = require("../utils/customError");

const getAllMember = async () => {
  const members = await memberModel.findAllMember();

  return members;
};

const getMemberById = async (id_member) => {
  const member = await memberModel.findMemberById(id_member);
  if (!member) throw new CustomError("Member Not Found!", 404);

  return member;
};

const createMember = async (member) => {
  const user = await authModel.findUserByEmail(member.email);
  if (user) throw new CustomError("Email Already Exist!", 400);

  const newMember = await memberModel.createMember(member);

  return newMember;
};

const updateMember = async (id_member, member) => {
  await getMemberById(id_member);
  const updateMember = await memberModel.updateMember(id_member, member);

  return updateMember;
};

const deleteMember = async (id_member) => {
  await getMemberById(id_member);
  const deleteMember = await memberModel.deleteMember(id_member);

  return deleteMember;
};

module.exports = {
  getAllMember,
  getMemberById,
  createMember,
  updateMember,
  deleteMember,
};
