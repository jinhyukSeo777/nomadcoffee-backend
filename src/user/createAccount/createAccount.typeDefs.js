const typeDefs = `
  scalar Upload
  type Mutation {
    createAccount(username:String!, password:String!, email: String!, avatar:Upload, name: String!, location: String!): MutationResult!
  }
`;

export default typeDefs;
