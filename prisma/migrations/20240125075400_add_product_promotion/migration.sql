/*
  Warnings:

  - Added the required column `bra_id` to the `products` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cat_id` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products` ADD COLUMN `bra_id` INTEGER NOT NULL,
    ADD COLUMN `cat_id` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Promotion` (
    `prm_id` INTEGER NOT NULL AUTO_INCREMENT,
    `prm_name` VARCHAR(191) NOT NULL,
    `pro_banner_url` VARCHAR(191) NULL,
    `prm_discount` INTEGER NULL,
    `prm_point` INTEGER NULL,

    PRIMARY KEY (`prm_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_promotion` (
    `pp_id` INTEGER NOT NULL AUTO_INCREMENT,
    `pro_id` INTEGER NOT NULL,
    `prm_id` INTEGER NOT NULL,

    PRIMARY KEY (`pp_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Product_image` (
    `img_id` INTEGER NOT NULL AUTO_INCREMENT,
    `img_url` VARCHAR(191) NOT NULL,
    `pro_id` INTEGER NOT NULL,

    PRIMARY KEY (`img_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `cat_id` INTEGER NOT NULL AUTO_INCREMENT,
    `cat_name` VARCHAR(191) NOT NULL,
    `cat_count` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`cat_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Brand` (
    `bra_id` INTEGER NOT NULL AUTO_INCREMENT,
    `bra_name` VARCHAR(191) NOT NULL,
    `bra_count` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`bra_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_cat_id_fkey` FOREIGN KEY (`cat_id`) REFERENCES `Category`(`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_bra_id_fkey` FOREIGN KEY (`bra_id`) REFERENCES `Brand`(`bra_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_promotion` ADD CONSTRAINT `product_promotion_pro_id_fkey` FOREIGN KEY (`pro_id`) REFERENCES `products`(`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_promotion` ADD CONSTRAINT `product_promotion_prm_id_fkey` FOREIGN KEY (`prm_id`) REFERENCES `Promotion`(`prm_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Product_image` ADD CONSTRAINT `Product_image_pro_id_fkey` FOREIGN KEY (`pro_id`) REFERENCES `products`(`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
