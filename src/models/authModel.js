const prisma = require("../config/database");

const findUserByEmail = async (email) => {
  const user =
    await prisma.$queryRaw`SELECT role AS user_type, email, password, nama_pegawai AS nama_user, id_pegawai AS id_user, alamat_pegawai AS alamat_user, tanggal_lahir_pegawai AS tanggal_lahir_user, no_telepon_pegawai AS no_telepon_user FROM pegawai WHERE email= ${email}
            UNION ALL
            SELECT "member" as user_type, email, password, nama_member AS nama_user, id_member AS id_user, alamat_member AS alamat_user, tanggal_lahir_member AS tanggal_lahir_user, no_telepon_member AS no_telepon_user FROM member WHERE email= ${email}
            UNION ALL
            SELECT "instruktur" as user_type, email, password, nama_instruktur AS nama_user, id_instruktur AS id_user, alamat_instruktur AS alamat_user, tanggal_lahir_instruktur AS tanggal_lahir_user, no_telepon_instruktur AS no_telepon_user FROM instruktur WHERE email= ${email}`;

  return user[0];
};

module.exports = {
  findUserByEmail,
};
