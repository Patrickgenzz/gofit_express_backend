-- CreateTable
CREATE TABLE `Member` (
    `id_member` VARCHAR(10) NOT NULL,
    `nama_member` VARCHAR(255) NOT NULL,
    `alamat_member` VARCHAR(255) NOT NULL,
    `no_telepon_member` VARCHAR(20) NOT NULL,
    `tanggal_lahir_member` DATETIME(3) NOT NULL,
    `sisa_deposit_uang` VARCHAR(255) NOT NULL,
    `tanggal_kadaluarsa` DATETIME(3) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `status` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `Member_id_member_key`(`id_member`),
    UNIQUE INDEX `Member_email_key`(`email`),
    PRIMARY KEY (`id_member`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pegawai` (
    `id_pegawai` VARCHAR(10) NOT NULL,
    `nama_pegawai` VARCHAR(255) NOT NULL,
    `alamat_pegawai` VARCHAR(255) NOT NULL,
    `no_telepon_pegawai` VARCHAR(20) NOT NULL,
    `tanggal_lahir_pegawai` DATETIME(3) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(20) NOT NULL,
    `role` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `Pegawai_id_pegawai_key`(`id_pegawai`),
    UNIQUE INDEX `Pegawai_email_key`(`email`),
    PRIMARY KEY (`id_pegawai`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Instruktur` (
    `id_instruktur` VARCHAR(10) NOT NULL,
    `nama_instruktur` VARCHAR(255) NOT NULL,
    `alamat_instruktur` VARCHAR(255) NOT NULL,
    `no_telepon_instruktur` VARCHAR(20) NOT NULL,
    `tanggal_lahir_instruktur` DATETIME(3) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `password` VARCHAR(20) NOT NULL,

    UNIQUE INDEX `Instruktur_id_instruktur_key`(`id_instruktur`),
    UNIQUE INDEX `Instruktur_email_key`(`email`),
    PRIMARY KEY (`id_instruktur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
