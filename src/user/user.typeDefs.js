const typeDefs = `
  type User {
    id: Int!
    email: String!
    username: String!
    password: String!
    avatar: String
    createdAt: String!
  }
  type MutationResult {
    ok: Boolean!
    error: String
  }
  type Query {
    hello: String!
  }
`;

export default typeDefs;
