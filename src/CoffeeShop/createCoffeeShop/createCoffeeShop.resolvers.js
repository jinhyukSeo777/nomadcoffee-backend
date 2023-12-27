import { PrismaClient } from "@prisma/client";
import { createWriteStream } from "fs";

const prisma = new PrismaClient();

const resolvers = {
  Mutation: {
    createCoffeeShop: async (
      _,
      { name, latitude, longitude, userId, photo, categories }
    ) => {
      const user = await prisma.user.findUnique({
        where: { id: userId },
      });
      if (!user) {
        return {
          ok: false,
          error: "user can not found.",
        };
      }

      let categoriesArr = [];
      if (categories) {
        const categoriesObj = categories.match(/#[\w]+/g);
        categoriesArr = categoriesObj.map((value) => ({
          where: {
            name: value,
          },
          create: {
            name: value,
            slug: value,
          },
        }));
      }

      const coffeeShop = await prisma.coffeeShop.create({
        data: {
          name,
          latitude,
          longitude,
          user: {
            connect: {
              id: userId,
            },
          },
          ...(categoriesArr.length > 0 && {
            categories: {
              connectOrCreate: [...categoriesArr],
            },
          }),
        },
      });

      let photoUrl = null;
      if (photo) {
        const filename = `${Date.now()}-${photo.file.filename}`;
        const readStream = photo.file.createReadStream();
        const writeStream = createWriteStream(
          process.cwd() + "/uploads/" + filename
        );
        readStream.pipe(writeStream);
        photoUrl = `http://localhost:4000/static/${filename}`;
        //avatarUrl = await uploadToS3(avatar, "avatars");

        const coffeeShopPhoto = await prisma.coffeeShopPhoto.create({
          data: {
            url: photoUrl,
            shop: {
              connect: {
                id: coffeeShop.id,
              },
            },
          },
        });
      }

      if (coffeeShop) {
        return {
          ok: true,
        };
      } else {
        return {
          ok: false,
          error: "create fail.",
        };
      }
    },
  },
};

export default resolvers;
