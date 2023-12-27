const typeDefs = `
  scalar Upload
  type Mutation {
    seeCoffeeShop(id: Int!): CoffeeShop!
  }
`;

export default typeDefs;
