const typeDefs = `
  type CoffeeShopPhoto {
    id: Int!
    url: String!
    shop: CoffeeShop
  }
  type CoffeeShop {
    id:         Int!
    name:       String!
    latitude:   String!
    longitude:  String!
    user:       User!
    photos:     [CoffeeShopPhoto]
    categories: [Category]
  }
`;

export default typeDefs;
