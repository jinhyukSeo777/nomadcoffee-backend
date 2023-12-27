const typeDefs = `
  type Mutation {
    seeCoffeeShops(page: Int!): [CoffeeShop]
  }
`;

export default typeDefs;
