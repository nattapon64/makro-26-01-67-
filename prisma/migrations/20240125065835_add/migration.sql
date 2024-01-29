-- CreateTable
CREATE TABLE `user` (
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    `user_name` VARCHAR(191) NULL,
    `user_email` VARCHAR(191) NOT NULL,
    `user_phone` VARCHAR(191) NULL,
    `user_password` VARCHAR(191) NOT NULL,
    `user_identity_number` VARCHAR(191) NULL,
    `user_branch_number` VARCHAR(191) NULL,
    `user_refund` ENUM('POINT', 'BANK') NULL,
    `user_point` INTEGER NOT NULL DEFAULT 0,

    UNIQUE INDEX `user_user_email_key`(`user_email`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `shipping_address` (
    `ship_id` INTEGER NOT NULL AUTO_INCREMENT,
    `ship_firstname` VARCHAR(191) NOT NULL,
    `ship_lastname` VARCHAR(191) NOT NULL,
    `ship_phone` VARCHAR(191) NOT NULL,
    `ship_email` VARCHAR(191) NULL,
    `ship_identity_number` VARCHAR(191) NULL,
    `ship_company` VARCHAR(191) NULL,
    `ship_branch` VARCHAR(191) NULL,
    `ship_address` VARCHAR(191) NOT NULL,
    `ship_apartment` VARCHAR(191) NULL,
    `ship_postal_code` VARCHAR(191) NOT NULL,
    `ship_province` VARCHAR(191) NOT NULL,
    `ship_district` VARCHAR(191) NOT NULL,
    `ship_sub_district` VARCHAR(191) NOT NULL,
    `ship_is_main_address` BOOLEAN NOT NULL,
    `user_id` INTEGER NOT NULL,

    PRIMARY KEY (`ship_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cart` (
    `cart_id` INTEGER NOT NULL AUTO_INCREMENT,
    `cart_total_before_discount` INTEGER NOT NULL DEFAULT 0,
    `cart_discount` INTEGER NOT NULL DEFAULT 0,
    `cart_delivery_free` INTEGER NOT NULL DEFAULT 0,
    `user_id` INTEGER NOT NULL,

    UNIQUE INDEX `cart_user_id_key`(`user_id`),
    PRIMARY KEY (`cart_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cart_product` (
    `cp_id` INTEGER NOT NULL AUTO_INCREMENT,
    `cp_quantity` INTEGER NOT NULL DEFAULT 1,
    `cart_id` INTEGER NOT NULL,
    `product_id` INTEGER NOT NULL,

    PRIMARY KEY (`cp_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `pro_id` INTEGER NOT NULL AUTO_INCREMENT,
    `pro_stock` INTEGER NOT NULL DEFAULT 0,
    `pro_unit` INTEGER NOT NULL DEFAULT 1,
    `pro_price_high` INTEGER NOT NULL,
    `pro_min_price_high` INTEGER NOT NULL,
    `pro_price_medium` INTEGER NULL,
    `pro_min_price_medium` INTEGER NULL,
    `pro_price_low` INTEGER NULL,
    `pro_min_price_low` INTEGER NULL,
    `pro_detail` VARCHAR(191) NOT NULL,
    `pro_depth` DECIMAL(65, 30) NOT NULL,
    `pro_width` DECIMAL(65, 30) NOT NULL,
    `pro_height` DECIMAL(65, 30) NOT NULL,
    `pro_weight` DECIMAL(65, 30) NOT NULL,
    `userId` INTEGER NOT NULL,

    PRIMARY KEY (`pro_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Favorite` (
    `fav_id` INTEGER NOT NULL AUTO_INCREMENT,
    `fav_name` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL,

    PRIMARY KEY (`fav_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Favorite_Product` (
    `fp_id` INTEGER NOT NULL AUTO_INCREMENT,
    `favorite_id` INTEGER NOT NULL,
    `product_id` INTEGER NOT NULL,

    PRIMARY KEY (`fp_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `shipping_address` ADD CONSTRAINT `shipping_address_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart` ADD CONSTRAINT `cart_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_product` ADD CONSTRAINT `cart_product_cart_id_fkey` FOREIGN KEY (`cart_id`) REFERENCES `cart`(`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_product` ADD CONSTRAINT `cart_product_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Favorite` ADD CONSTRAINT `Favorite_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Favorite_Product` ADD CONSTRAINT `Favorite_Product_favorite_id_fkey` FOREIGN KEY (`favorite_id`) REFERENCES `Favorite`(`fav_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Favorite_Product` ADD CONSTRAINT `Favorite_Product_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
