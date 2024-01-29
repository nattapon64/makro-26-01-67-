-- CreateTable
CREATE TABLE `Search` (
    `search_id` INTEGER NOT NULL AUTO_INCREMENT,
    `search_name` VARCHAR(191) NOT NULL,
    `search_count` INTEGER NOT NULL,

    PRIMARY KEY (`search_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User_Search` (
    `us_id` INTEGER NOT NULL AUTO_INCREMENT,
    `User_id` INTEGER NOT NULL,
    `search_id` INTEGER NOT NULL,

    PRIMARY KEY (`us_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User_Search` ADD CONSTRAINT `User_Search_User_id_fkey` FOREIGN KEY (`User_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `User_Search` ADD CONSTRAINT `User_Search_search_id_fkey` FOREIGN KEY (`search_id`) REFERENCES `Search`(`search_id`) ON DELETE CASCADE ON UPDATE CASCADE;
