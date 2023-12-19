/*
  Warnings:

  - You are about to drop the column `score` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `socialLogin` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `summary` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `totalLose` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `totalWin` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Comment` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Feed` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Match` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UserMatch` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_feedId_fkey";

-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_userId_fkey";

-- DropForeignKey
ALTER TABLE "Feed" DROP CONSTRAINT "Feed_userId_fkey";

-- DropForeignKey
ALTER TABLE "UserMatch" DROP CONSTRAINT "UserMatch_matchId_fkey";

-- DropForeignKey
ALTER TABLE "UserMatch" DROP CONSTRAINT "UserMatch_userId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "score",
DROP COLUMN "socialLogin",
DROP COLUMN "summary",
DROP COLUMN "totalLose",
DROP COLUMN "totalWin";

-- DropTable
DROP TABLE "Comment";

-- DropTable
DROP TABLE "Feed";

-- DropTable
DROP TABLE "Match";

-- DropTable
DROP TABLE "UserMatch";
