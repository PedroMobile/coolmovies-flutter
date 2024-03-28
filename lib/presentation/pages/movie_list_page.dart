import 'package:coolmovies/core/constants/constants.dart';
import 'package:coolmovies/data/datasources/movie_data_source.dart';
import 'package:coolmovies/data/datasources/movie_data_source_impl.dart';
import 'package:coolmovies/data/repositories/movie_repository_impl.dart';
import 'package:coolmovies/domain/repositories/movie_repository.dart';
import 'package:coolmovies/domain/usecases/get_movies_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:coolmovies/core/navigation/navigation_service.dart';
import 'package:coolmovies/core/navigation/routes.dart';
import 'package:coolmovies/presentation/widgets/card_image.dart';
import 'package:coolmovies/presentation/blocs/movie_list_bloc.dart';
import 'package:coolmovies/domain/entities/movie.dart';

class MovieListPage extends StatelessWidget {

  final NavigationService navigationService;

  const MovieListPage({super.key, required this.navigationService});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(Constants.graphqlApiUrl);
    final GraphQLClient client = GraphQLClient(link: httpLink, cache: GraphQLCache());
    final MovieDataSource dataSource = MovieDataSourceImpl(client);
    final MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
    final GetMoviesUseCase getMoviesUseCase = GetMoviesUseCase(movieRepository);
    final MovieListBloc bloc = MovieListBloc(getMoviesUseCase);

    // Inicialize e dispare a busca por filmes
    bloc.fetchMovies();

    return BlocProvider<MovieListBloc>(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Lista de Filmes')),
        body: BlocBuilder<MovieListBloc, List<Movie>>(
          builder: (context, movieList) {
            if (movieList.isEmpty) {
              return Center(child: Text("Nenhum filme encontrado"));
            }
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 11 / 16,
              padding: const EdgeInsets.all(8),
              children: movieList.map((movie) => _buildItem(context, movie)).toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.fetchMovies();
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Movie movie) {
    return CardImage(
      imageUrl: movie.imgUrl,
      placeholder: "Placeholder Image",
      onTap: () {
        navigationService.navigateTo(Routes.details, arguments: movie);
      },
    );
  }
}