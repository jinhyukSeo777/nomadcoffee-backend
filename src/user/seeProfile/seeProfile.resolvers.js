import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const resolvers = {
  Query: {
    seeProfile: (_, { id }) => {
      return prisma.user.findUnique({
        where: { id },
      });
    },
  },
};

export default resolvers;
