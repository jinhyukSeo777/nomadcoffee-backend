const typeDefs = `
  scalar Upload
  type Mutation {
    editProfile(username:String, password:String, email:String, name: String, location: String, avatarUrl:Upload): MutationResult!
  }
`;

export default typeDefs;
