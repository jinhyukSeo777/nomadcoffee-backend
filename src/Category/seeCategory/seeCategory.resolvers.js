import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const resolvers = {
  Mutation: {
    seeCategory: async (_, { category, page }) => {
      return prisma.coffeeShop.findMany({
        where: {
          categories: {
            some: {
              name: category,
            },
          },
        },
        take: 5,
        skip: (page - 1) * 5,
      });
    },
  },
};

export default resolvers;
