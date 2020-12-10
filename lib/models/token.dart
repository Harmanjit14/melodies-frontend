import 'package:graphql_flutter/graphql_flutter.dart';

String token="";

Future<int> getToken(String email, String password) async {
  HttpLink _httpLink = HttpLink(
    uri: "https://melodies-backend.herokuapp.com/api/",
  );

  GraphQLClient _client = GraphQLClient(
    defaultPolicies: DefaultPolicies(
        mutate:
            Policies(error: ErrorPolicy.all, fetch: FetchPolicy.networkOnly),
        query: Policies(fetch: FetchPolicy.noCache)),
    cache: NormalizedInMemoryCache(dataIdFromObject: typenameDataIdFromObject),
    link: _httpLink,
  );

  String getAuthToken = """
  mutation{
    tokenAuth(email : "$email", password: "$password"){
      token
    }
  }
""";
  MutationOptions tokenGet = MutationOptions(
    documentNode: gql(getAuthToken),
  );
  print("\n\nstarted\n\n");

  QueryResult result = await _client.mutate(tokenGet);
  if (result.hasException) {
    print(result.exception);
    return 0;
  } else {
    print("done");
    token = result.data["tokenAuth"]["token"];

    return 1;
  }
}