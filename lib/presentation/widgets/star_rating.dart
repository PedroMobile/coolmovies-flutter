import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maxRating;
  final int initialRating;
  final Function(int rating)? onRatingChanged;

  StarRating({this.maxRating = 5, this.initialRating = 0, this.onRatingChanged});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.maxRating, (index) {
        return GestureDetector(
          onTap: () {
            if (widget.onRatingChanged != null) {
              setState(() {
                _currentRating = index + 1;
                widget.onRatingChanged!(_currentRating);
              });
            }
          },
          child: Icon(
            _currentRating > index ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
        );
      }),
    );
  }
}

