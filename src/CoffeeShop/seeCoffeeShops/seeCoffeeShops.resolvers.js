import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const resolvers = {
  Mutation: {
    seeCoffeeShops: async (_, { page }) => {
      return prisma.coffeeShop.findMany({
        where: {},
        take: 5,
        skip: (page - 1) * 5,
        include: { categories: true, photos: true },
      });
    },
  },
};

export default resolvers;
