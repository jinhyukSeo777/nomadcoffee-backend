import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const resolvers = {
  Mutation: {
    createAccount: async (_, { username, password, email, name, location }) => {
      const isExist = await prisma.user.findFirst({
        where: {
          OR: [{ username }, { email }],
        },
      });
      if (isExist) {
        return {
          ok: false,
          error: "유저이름 또는 이메일이 이미 존재합니다.",
        };
      }

      const newPassword = await bcrypt.hash(password, 10);

      const user = await prisma.user.create({
        data: {
          username,
          password: newPassword,
          email,
          name,
          location,
        },
      });

      //const token = jwt.sign({ id: user.id }, process.env.SECRET_KEY);
      if (user) {
        return {
          ok: true,
        };
      } else {
        return {
          ok: false,
          error: "create fail",
        };
      }
    },
  },
};

export default resolvers;
