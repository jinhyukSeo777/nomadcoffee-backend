const typeDefs = `
  type User {
    id: Int!
    username: String
    githubUsername:String
    password: String
    email: String!
    avatarUrl: String
    name:String!
    location:String!
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
