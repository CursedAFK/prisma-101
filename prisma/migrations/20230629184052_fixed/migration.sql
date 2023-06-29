/*
  Warnings:

  - You are about to drop the `userprefrence` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userPreferenceId]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `userprefrence` DROP FOREIGN KEY `UserPrefrence_userId_fkey`;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `userPreferenceId` VARCHAR(191) NULL;

-- DropTable
DROP TABLE `userprefrence`;

-- CreateTable
CREATE TABLE `UserPreference` (
    `id` VARCHAR(191) NOT NULL,
    `emailUpdates` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `User_userPreferenceId_key` ON `User`(`userPreferenceId`);

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_userPreferenceId_fkey` FOREIGN KEY (`userPreferenceId`) REFERENCES `UserPreference`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
