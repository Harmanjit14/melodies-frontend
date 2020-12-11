import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:melodies/models/token.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String getGenre = """
                        {
                            genre{
                                    id
                                    genere
                                    image
                                    
                                  }
                                }
                              
                          """;

  @override
  Widget build(BuildContext context) {
    final HttpLink _link =
        HttpLink(uri: "https://melodies-backend.herokuapp.com/api/");

    final AuthLink authLink = AuthLink(
      getToken: () async => 'JWT $token',
      // OR
      // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );
    final Link link = authLink.concat(_link);
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
          defaultPolicies: DefaultPolicies(
              query: Policies(fetch: FetchPolicy.cacheAndNetwork)),
          link: link,
          cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject)),
    );
    return GraphQLProvider(
      client: client,
      child: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome Back',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          letterSpacing: -0.5),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 0, bottom: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'User Name',
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5),
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'lib/assets/art3.png',
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                //height: 200,
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: RichText(
                                  maxLines: 4,
                                  text: TextSpan(
                                    text: 'Here is your ',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        letterSpacing: -0.5),
                                    children: [
                                      TextSpan(
                                          text: 'personalised',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: ' playlist based on your',
                                      ),
                                      TextSpan(
                                          text: ' likings',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: OutlineButton(
                                  borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                      style: BorderStyle.solid),
                                  color: Colors.white,
                                  highlightedBorderColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  onPressed: () {},
                                  child: Text(
                                    'Play',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Languages",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 150,
                    child: Query(
                      options: QueryOptions(documentNode: gql(getGenre)),
                      builder: (result, {fetchMore, refetch}) {
                        if (result.hasException) {
                          print(result.exception);
                          return Container(
                            child: Text("Error Fetching Data!"),
                          );
                        } else if (result.loading) {
                          return Container(
                            child: SpinKitCircle(
                              color: Colors.blue,
                            ),
                          );
                        } else {
                          List genre = result.data["genre"];
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: genre.length,
                              itemBuilder: (context, index) {
                                final title = genre[index]["genere"];
                                final image = genre[index]["image"];
                                final id = genre[index]["id"];
                                return language(title, id, image);
                              });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget language(String title, String id, String image) {
  return Container(
    child: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            print(title);
          },
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Image.network(image),
                radius: 60,
              ),
              Text(title),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}
