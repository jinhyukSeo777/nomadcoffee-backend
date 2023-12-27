import { PrismaClient } from "@prisma/client";
import { createWriteStream } from "fs";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const resolvers = {
  Mutation: {
    createAccount: async (
      _,
      { username, password, email, avatar, name, location }
    ) => {
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

      let avatarUrl = null;
      if (avatar) {
        const filename = `${Date.now()}-${avatar.file.filename}`;
        const readStream = avatar.file.createReadStream();
        const writeStream = createWriteStream(
          process.cwd() + "/uploads/" + filename
        );
        readStream.pipe(writeStream);
        avatarUrl = `http://localhost:4000/static/${filename}`;
        //avatarUrl = await uploadToS3(avatar, "avatars");
      }

      const user = await prisma.user.create({
        data: {
          username,
          password: newPassword,
          email,
          avatarUrl: avatarUrl ? avatarUrl : "",
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
