import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const resolvers = {
  Mutation: {
    seeCoffeeShop: async (_, { id }) => {
      return prisma.coffeeShop.findUnique({
        where: { id },
        include: { categories: true, photos: true },
      });
    },
  },
};

export default resolvers;
