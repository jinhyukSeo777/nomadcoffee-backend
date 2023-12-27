const typeDefs = `
  scalar Upload
  type Mutation {
    editCoffeeShop(shopId: Int!, name: String!, latitude: String!, longitude: String!, categories: String, photo: Upload): MutationResult!
  }
`;

export default typeDefs;
