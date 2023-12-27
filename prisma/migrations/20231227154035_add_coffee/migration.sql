/*
  Warnings:

  - You are about to drop the `CoffeShop` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CoffeShopPhoto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CategoryToCoffeShop` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CoffeShop" DROP CONSTRAINT "CoffeShop_userId_fkey";

-- DropForeignKey
ALTER TABLE "CoffeShopPhoto" DROP CONSTRAINT "CoffeShopPhoto_coffeshopId_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToCoffeShop" DROP CONSTRAINT "_CategoryToCoffeShop_A_fkey";

-- DropForeignKey
ALTER TABLE "_CategoryToCoffeShop" DROP CONSTRAINT "_CategoryToCoffeShop_B_fkey";

-- DropTable
DROP TABLE "CoffeShop";

-- DropTable
DROP TABLE "CoffeShopPhoto";

-- DropTable
DROP TABLE "_CategoryToCoffeShop";

-- CreateTable
CREATE TABLE "CoffeeShop" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "latitude" TEXT NOT NULL,
    "longtitude" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "CoffeeShop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoffeeShopPhoto" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "coffeeshopId" INTEGER NOT NULL,

    CONSTRAINT "CoffeeShopPhoto_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CategoryToCoffeeShop" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_CategoryToCoffeeShop_AB_unique" ON "_CategoryToCoffeeShop"("A", "B");

-- CreateIndex
CREATE INDEX "_CategoryToCoffeeShop_B_index" ON "_CategoryToCoffeeShop"("B");

-- AddForeignKey
ALTER TABLE "CoffeeShop" ADD CONSTRAINT "CoffeeShop_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoffeeShopPhoto" ADD CONSTRAINT "CoffeeShopPhoto_coffeeshopId_fkey" FOREIGN KEY ("coffeeshopId") REFERENCES "CoffeeShop"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToCoffeeShop" ADD CONSTRAINT "_CategoryToCoffeeShop_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CategoryToCoffeeShop" ADD CONSTRAINT "_CategoryToCoffeeShop_B_fkey" FOREIGN KEY ("B") REFERENCES "CoffeeShop"("id") ON DELETE CASCADE ON UPDATE CASCADE;
