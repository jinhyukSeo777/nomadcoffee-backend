import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const resolvers = {
  Category: {
    totalShops: ({ id }) =>
      prisma.coffeeShop.count({
        where: {
          categories: {
            some: { id },
          },
        },
      }),
  },
};

export default resolvers;
