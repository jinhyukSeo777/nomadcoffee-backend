/*
  Warnings:

  - A unique constraint covering the columns `[githubUsername]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Made the column `email` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `username` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `password` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `avatarUrl` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `location` on table `User` required. This step will fail if there are existing NULL values in that column.
  - Made the column `name` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "User" ALTER COLUMN "email" SET NOT NULL,
ALTER COLUMN "username" SET NOT NULL,
ALTER COLUMN "password" SET NOT NULL,
ALTER COLUMN "avatarUrl" SET NOT NULL,
ALTER COLUMN "location" SET NOT NULL,
ALTER COLUMN "name" SET NOT NULL;

-- CreateTable
CREATE TABLE "CoffeShop" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "latitude" TEXT NOT NULL,
    "longtitude" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "CoffeShop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoffeShopPhoto" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "coffeshopId" INTEGER NOT NULL,

    CONSTRAINT "CoffeShopPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryToCoffeShop" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToCoffeShop_AB_unique" ON "_CategoryToCoffeShop"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToCoffeShop_B_index" ON "_CategoryToCoffeShop"("B");

-- CreateIndex
CREATE UNIQUE INDEX "User_githubUsername_key" ON "User"("githubUsername");

-- AddForeignKey
ALTER TABLE "CoffeShop" ADD CONSTRAINT "CoffeShop_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoffeShopPhoto" ADD CONSTRAINT "CoffeShopPhoto_coffeshopId_fkey" FOREIGN KEY ("coffeshopId") REFERENCES "CoffeShop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToCoffeShop" ADD CONSTRAINT "_CategoryToCoffeShop_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToCoffeShop" ADD CONSTRAINT "_CategoryToCoffeShop_B_fkey" FOREIGN KEY ("B") REFERENCES "CoffeShop"("id") ON DELETE CASCADE ON UPDATE CASCADE;
