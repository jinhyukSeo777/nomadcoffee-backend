const typeDefs = `
  type User {
    id: Int!
    email: String
    username: String
    password: String
    avatarUrl: String
    name:String
    location:String
    githubUsername:String
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
