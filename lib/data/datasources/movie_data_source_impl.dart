import 'package:coolmovies/data/helpers/movie_queries.dart'; // Importing movie queries
import 'package:graphql/client.dart';
import 'package:coolmovies/data/datasources/movie_data_source.dart';
import 'package:coolmovies/domain/entities/movie.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final GraphQLClient _client;

  // Constructor for MovieDataSourceImpl
  MovieDataSourceImpl(this._client);

  @override
  Future<List<Movie>> getMoviesFromAPI() async {
    // Retrieving movie data using the provided query
    final QueryResult result = await _getClientData(MovieQueries.allMoviesQuery);

    if (result.hasException) {
      // Throwing an exception if there was an error fetching movies
      throw Exception('Error fetching movies: ${result.exception.toString()}');
    }

    // Parsing the fetched data into a list of Movies
    final List<Movie> moviesList = _parseData(result.data);

    return moviesList;
  }

  // Method to fetch data from the GraphQL client
  Future<QueryResult> _getClientData(String query) async {
    final QueryOptions options = QueryOptions(document: gql(query));
    return _client.query(options);
  }

  // Method to parse the fetched data into a list of Movie objects
  List<Movie> _parseData(Map<String, dynamic>? data) {
    final Map<String, dynamic>? allMovies = data?['allMovies'] as Map<String, dynamic>?;
    final List<dynamic>? nodes = allMovies?['nodes'] as List<dynamic>?;

    // Mapping the JSON data to Movie objects using 'fromJson' constructor
    return nodes?.map((jsonData) => Movie.fromJson(jsonData as Map<String, dynamic>)).toList() ?? [];
  }
}