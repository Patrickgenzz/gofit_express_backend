/*
  Warnings:

  - You are about to alter the column `tanggal_kadaluarsa` on the `member` table. The data in that column could be lost. The data in that column will be cast from `DateTime(3)` to `DateTime(0)`.
  - You are about to alter the column `status` on the `member` table. The data in that column could be lost. The data in that column will be cast from `VarChar(255)` to `VarChar(20)`.

*/
-- DropIndex
DROP INDEX `Instruktur_email_key` ON `instruktur`;

-- DropIndex
DROP INDEX `Instruktur_id_instruktur_key` ON `instruktur`;

-- DropIndex
DROP INDEX `Member_email_key` ON `member`;

-- DropIndex
DROP INDEX `Member_id_member_key` ON `member`;

-- DropIndex
DROP INDEX `Pegawai_email_key` ON `pegawai`;

-- DropIndex
DROP INDEX `Pegawai_id_pegawai_key` ON `pegawai`;

-- AlterTable
ALTER TABLE `instruktur` MODIFY `nama_instruktur` VARCHAR(255) NULL,
    MODIFY `alamat_instruktur` VARCHAR(255) NULL,
    MODIFY `no_telepon_instruktur` VARCHAR(20) NULL,
    MODIFY `tanggal_lahir_instruktur` DATE NULL,
    MODIFY `email` VARCHAR(255) NULL,
    MODIFY `password` VARCHAR(255) NULL;

-- AlterTable
ALTER TABLE `member` MODIFY `nama_member` VARCHAR(255) NULL,
    MODIFY `alamat_member` VARCHAR(255) NULL,
    MODIFY `no_telepon_member` VARCHAR(20) NULL,
    MODIFY `tanggal_lahir_member` DATE NULL,
    MODIFY `sisa_deposit_uang` VARCHAR(255) NULL,
    MODIFY `tanggal_kadaluarsa` DATETIME(0) NULL,
    MODIFY `email` VARCHAR(255) NULL,
    MODIFY `password` VARCHAR(255) NULL,
    MODIFY `status` VARCHAR(20) NULL;

-- AlterTable
ALTER TABLE `pegawai` MODIFY `nama_pegawai` VARCHAR(255) NULL,
    MODIFY `alamat_pegawai` VARCHAR(255) NULL,
    MODIFY `no_telepon_pegawai` VARCHAR(20) NULL,
    MODIFY `tanggal_lahir_pegawai` DATE NULL,
    MODIFY `email` VARCHAR(255) NULL,
    MODIFY `password` VARCHAR(255) NULL,
    MODIFY `role` VARCHAR(20) NULL;

-- CreateTable
CREATE TABLE `deposit_kelas_member` (
    `id_deposit_kelas_member` VARCHAR(10) NOT NULL,
    `id_member` VARCHAR(10) NOT NULL,
    `id_kelas` VARCHAR(10) NOT NULL,
    `sisa_deposit_kelas` INTEGER NULL,

    INDEX `RELATION_269_FK`(`id_member`),
    INDEX `RELATION_270_FK`(`id_kelas`),
    PRIMARY KEY (`id_deposit_kelas_member`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `izin_instruktur` (
    `id_izin_instruktur` VARCHAR(10) NOT NULL,
    `id_instruktur` VARCHAR(10) NULL,
    `tanggal_pembuatan` DATETIME(0) NULL,
    `tanggal_izin` DATETIME(0) NULL,
    `alasan_izin` VARCHAR(255) NULL,
    `status_konfirmasi_izin` VARCHAR(20) NULL,
    `tanggal_konfirmasi` DATETIME(0) NULL,
    `instruktur_pengganti` VARCHAR(255) NOT NULL,

    INDEX `RELATION_162_FK`(`id_instruktur`),
    PRIMARY KEY (`id_izin_instruktur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jadwal_harian` (
    `tanggal_jadwal_harian` DATETIME(0) NOT NULL,
    `id_jadwal_umum` VARCHAR(10) NOT NULL,
    `id_instruktur` VARCHAR(10) NULL,
    `status_kelas` VARCHAR(20) NULL,

    INDEX `RELATION_259_FK`(`id_jadwal_umum`),
    INDEX `RELATION_262_FK`(`id_instruktur`),
    PRIMARY KEY (`tanggal_jadwal_harian`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `jadwal_umum` (
    `id_jadwal_umum` VARCHAR(10) NOT NULL,
    `id_kelas` VARCHAR(10) NULL,
    `id_instruktur` VARCHAR(10) NULL,
    `hari_jadwal_umum` VARCHAR(20) NULL,
    `sesi_jadwal_umum` INTEGER NULL,

    INDEX `RELATION_488_FK`(`id_kelas`),
    INDEX `RELATION_491_FK`(`id_instruktur`),
    PRIMARY KEY (`id_jadwal_umum`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kelas` (
    `id_kelas` VARCHAR(10) NOT NULL,
    `jenis_kelas` VARCHAR(255) NULL,
    `tarif_kelas` INTEGER NULL,
    `kuota` INTEGER NOT NULL,

    PRIMARY KEY (`id_kelas`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `presensi_booking_gym` (
    `id_booking_gym` VARCHAR(10) NOT NULL,
    `id_member` VARCHAR(10) NOT NULL,
    `tanggal_booking_gym` DATETIME(0) NULL,
    `tanggal_dibooking_gym` DATETIME(0) NULL,
    `waktu_presensi_gym` DATETIME(0) NULL,
    `slot_waktu_gym` INTEGER NULL,
    `status` VARCHAR(20) NOT NULL,

    INDEX `RELATION_265_FK`(`id_member`),
    PRIMARY KEY (`id_booking_gym`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `presensi_booking_kelas` (
    `id_booking_kelas` VARCHAR(10) NOT NULL,
    `id_member` VARCHAR(10) NOT NULL,
    `tanggal_booking_kelas` DATETIME(0) NULL,
    `tanggal_dibooking_kelas` DATETIME(0) NULL,
    `waktu_presensi_kelas` DATETIME(0) NULL,
    `tarif_kelas` INTEGER NULL,
    `status` VARCHAR(20) NOT NULL,

    INDEX `RELATION_263_FK`(`id_member`),
    PRIMARY KEY (`id_booking_kelas`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `presensi_instruktur` (
    `id_presensi_instruktur` CHAR(10) NOT NULL,
    `id_instruktur` VARCHAR(10) NOT NULL,
    `tanggal_jadwal_harian` DATETIME(0) NULL,
    `waktu_mulai_kelas` TIME(0) NULL,
    `waktu_selesai_kelas` TIME(0) NULL,
    `durasi_kelas` INTEGER NULL,
    `keterlambatan` INTEGER NULL,

    INDEX `RELATION_161_FK`(`id_instruktur`),
    INDEX `RELATION_261_FK`(`tanggal_jadwal_harian`),
    PRIMARY KEY (`id_presensi_instruktur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `promo` (
    `id_promo` VARCHAR(10) NOT NULL,
    `jenis_promo` VARCHAR(255) NULL,
    `waktu_mulai_promo` DATETIME(0) NULL,
    `waktu_selesai_promo` DATETIME(0) NULL,
    `minimal_pembelian` INTEGER NULL,
    `bonus` INTEGER NULL,

    PRIMARY KEY (`id_promo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaksi_aktivasi` (
    `id_aktivasi` VARCHAR(10) NOT NULL,
    `id_member` VARCHAR(10) NULL,
    `id_pegawai` VARCHAR(10) NULL,
    `tanggal_aktivasi` DATETIME(0) NULL,
    `jumlay_pembayaran` INTEGER NULL,
    `masa_berlaku_aktivasi` DATETIME(0) NULL,

    INDEX `RELATION_154_FK`(`id_member`),
    INDEX `RELATION_490_FK`(`id_pegawai`),
    PRIMARY KEY (`id_aktivasi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaksi_deposit_kelas` (
    `id_deposit_kelas` VARCHAR(10) NOT NULL,
    `id_member` VARCHAR(10) NULL,
    `id_promo` VARCHAR(10) NULL,
    `id_kelas` VARCHAR(10) NOT NULL,
    `id_pegawai` VARCHAR(10) NULL,
    `tanggal_deposit_kelas` DATETIME(0) NULL,
    `jumlah_deposit_kelas` INTEGER NULL,
    `bonus_deposit_kelas` INTEGER NULL,
    `masa_berlaku_deposit_kelas` DATETIME(0) NULL,
    `jumlah_pembayaran` INTEGER NULL,
    `total_deposit_kelas` INTEGER NULL,

    INDEX `RELATION_156_FK`(`id_member`),
    INDEX `RELATION_159_FK`(`id_promo`),
    INDEX `RELATION_160_FK`(`id_kelas`),
    INDEX `RELATION_493_FK`(`id_pegawai`),
    PRIMARY KEY (`id_deposit_kelas`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaksi_deposit_uang` (
    `id_deposit_uang` VARCHAR(10) NOT NULL,
    `id_member` VARCHAR(10) NULL,
    `id_pegawai` VARCHAR(10) NULL,
    `id_promo` VARCHAR(10) NULL,
    `tanggal_deposit_uang` DATETIME(0) NULL,
    `jumlah_deposit_uang` INTEGER NULL,
    `bonus_deposit_uang` INTEGER NULL,
    `total_deposit_uang` INTEGER NULL,

    INDEX `RELATION_155_FK`(`id_member`),
    INDEX `RELATION_157_FK`(`id_pegawai`),
    INDEX `RELATION_158_FK`(`id_promo`),
    PRIMARY KEY (`id_deposit_uang`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `deposit_kelas_member` ADD CONSTRAINT `FK_RELATION_269` FOREIGN KEY (`id_member`) REFERENCES `member`(`id_member`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `deposit_kelas_member` ADD CONSTRAINT `FK_RELATION_270` FOREIGN KEY (`id_kelas`) REFERENCES `kelas`(`id_kelas`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `izin_instruktur` ADD CONSTRAINT `FK_RELATION_162` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur`(`id_instruktur`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jadwal_harian` ADD CONSTRAINT `FK_RELATION_259` FOREIGN KEY (`id_jadwal_umum`) REFERENCES `jadwal_umum`(`id_jadwal_umum`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jadwal_harian` ADD CONSTRAINT `FK_RELATION_262` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur`(`id_instruktur`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jadwal_umum` ADD CONSTRAINT `FK_RELATION_488` FOREIGN KEY (`id_kelas`) REFERENCES `kelas`(`id_kelas`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `jadwal_umum` ADD CONSTRAINT `FK_RELATION_491` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur`(`id_instruktur`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `presensi_booking_gym` ADD CONSTRAINT `FK_RELATION_265` FOREIGN KEY (`id_member`) REFERENCES `member`(`id_member`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `presensi_booking_kelas` ADD CONSTRAINT `FK_RELATION_263` FOREIGN KEY (`id_member`) REFERENCES `member`(`id_member`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `presensi_instruktur` ADD CONSTRAINT `FK_RELATION_161` FOREIGN KEY (`id_instruktur`) REFERENCES `instruktur`(`id_instruktur`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `presensi_instruktur` ADD CONSTRAINT `FK_RELATION_261` FOREIGN KEY (`tanggal_jadwal_harian`) REFERENCES `jadwal_harian`(`tanggal_jadwal_harian`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_aktivasi` ADD CONSTRAINT `FK_RELATION_154` FOREIGN KEY (`id_member`) REFERENCES `member`(`id_member`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_aktivasi` ADD CONSTRAINT `FK_RELATION_490` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai`(`id_pegawai`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_kelas` ADD CONSTRAINT `FK_RELATION_156` FOREIGN KEY (`id_member`) REFERENCES `member`(`id_member`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_kelas` ADD CONSTRAINT `FK_RELATION_159` FOREIGN KEY (`id_promo`) REFERENCES `promo`(`id_promo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_kelas` ADD CONSTRAINT `FK_RELATION_160` FOREIGN KEY (`id_kelas`) REFERENCES `kelas`(`id_kelas`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_kelas` ADD CONSTRAINT `FK_RELATION_493` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai`(`id_pegawai`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_uang` ADD CONSTRAINT `FK_RELATION_155` FOREIGN KEY (`id_member`) REFERENCES `member`(`id_member`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_uang` ADD CONSTRAINT `FK_RELATION_157` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai`(`id_pegawai`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `transaksi_deposit_uang` ADD CONSTRAINT `FK_RELATION_158` FOREIGN KEY (`id_promo`) REFERENCES `promo`(`id_promo`) ON DELETE RESTRICT ON UPDATE RESTRICT;
