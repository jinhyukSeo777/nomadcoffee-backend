const typeDefs = `
  type Category {
      id:     Int!
      name:   String!
      slug:   String!
      shops:  [CoffeeShop]
      totalShops: Int!
  }
`;

export default typeDefs;
