const typeDefs = `
  type Mutation {
    seeCategory(category: String!,page: Int!): [CoffeeShop]
  }
`;

export default typeDefs;
