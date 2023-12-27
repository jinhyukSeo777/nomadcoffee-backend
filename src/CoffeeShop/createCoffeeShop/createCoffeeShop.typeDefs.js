const typeDefs = `
  scalar Upload
  type Mutation {
    createCoffeeShop(name: String!, latitude: String!, longitude: String!, userId: Int!, categories: String, photo: Upload): MutationResult!
  }
`;

export default typeDefs;
