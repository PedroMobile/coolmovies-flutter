class MovieQueries {
  static String allMoviesQuery = """
    query AllMovies {
      allMovies {
        nodes {
          imgUrl
          title
          releaseDate
          userByUserCreatorId {
            name
          }
          movieDirectorByMovieDirectorId {
            name
          }
          movieReviewsByMovieId {
            nodes {
              title
              rating
              body
              userByUserReviewerId {
                name
              }
              id
            }
          }
          id
        }
      }
    }
  """;
}