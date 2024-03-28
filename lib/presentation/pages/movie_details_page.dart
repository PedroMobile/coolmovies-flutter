import 'package:coolmovies/domain/entities/movie.dart';
import 'package:coolmovies/domain/entities/movie_review.dart';
import 'package:coolmovies/presentation/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Image.network(
                  movie.imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text("Title: ${movie.title}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Date release: ${movie.releaseDate}"),
              SizedBox(height: 5),
              Text("Director: ${movie.movieDirectorByMovieDirectorId.name}"),
              SizedBox(height: 5),
              Text("Created by: ${movie.userByUserCreatorId.name}"),
              SizedBox(height: 10),
              Text("Movie Reviews:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Column(
                children: movie.movieReviewsByMovieId.map((review) => _buildReviewItem(context, review)).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _openAddReviewModal(context);
                },
                child: Text('Add Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewItem(BuildContext context, MovieReview review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Title: ${review.title}", style: TextStyle(fontWeight: FontWeight.bold)),
        StarRating(initialRating: review.rating,),
        Text("Review: ${review.body}"),
        SizedBox(height: 5),
        Text("Reviewed by: ${review.userByUserReviewerId.name}"),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }

  void _openAddReviewModal(BuildContext context) {
    int selectedRating = 0;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Review', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextField(decoration: InputDecoration(labelText: 'Title')),
              TextField(decoration: InputDecoration(labelText: 'Description')),
              StarRating(initialRating: selectedRating,
                onRatingChanged: (rating) {
                  selectedRating = rating;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save the new review
                  Navigator.pop(context);
                },
                child: Text('Submit Review'),
              ),
            ],
          ),
        );
      },
    );
  }
}

