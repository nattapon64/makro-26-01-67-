-- CreateTable
CREATE TABLE `order` (
    `order_id` INTEGER NOT NULL AUTO_INCREMENT,
    `order_total_before_discount` INTEGER NOT NULL DEFAULT 0,
    `order_discount` INTEGER NOT NULL DEFAULT 0,
    `order_delivery_fee` INTEGER NOT NULL DEFAULT 0,
    `order_total` INTEGER NOT NULL DEFAULT 0,
    `order_created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `user_id` INTEGER NOT NULL,

    PRIMARY KEY (`order_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Status` (
    `sta_id` INTEGER NOT NULL AUTO_INCREMENT,
    `sta_status` ENUM('UNPAID', 'PREPARED', 'SHIPPED', 'DELIVERY', 'CANCELLED') NOT NULL DEFAULT 'UNPAID',
    `sta_created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `order_id` INTEGER NOT NULL,

    PRIMARY KEY (`sta_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_product` (
    `op_id` INTEGER NOT NULL AUTO_INCREMENT,
    `op_quantity` INTEGER NOT NULL DEFAULT 1,
    `order_id` INTEGER NOT NULL,
    `pro_id` INTEGER NOT NULL,

    PRIMARY KEY (`op_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `order_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Status` ADD CONSTRAINT `Status_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_product` ADD CONSTRAINT `order_product_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_product` ADD CONSTRAINT `order_product_pro_id_fkey` FOREIGN KEY (`pro_id`) REFERENCES `products`(`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE;
