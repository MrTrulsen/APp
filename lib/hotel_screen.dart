import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/hotel_model.dart';

class HotelScreenHero extends StatefulWidget {
  final Hotel hotel;

  HotelScreenHero({this.hotel});

  @override
  _HotelScreenHeroState createState() => _HotelScreenHeroState();
}

class _HotelScreenHeroState extends State<HotelScreenHero> {
  Text _buildRatingStars(double rating) {
    String stars = '';
    for (double i = 0; i < rating; i++) {
      stars += '⭐';
    }
    return Text(
      stars + " (" + rating.toString() + ")",
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        letterSpacing: 1.3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: widget.hotel.imageUrl,
              child: Image(
                image: AssetImage(widget.hotel.imageUrl),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black54,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 32.0,
                  ),
                  Spacer(),
                  Container(
                    width: 220.0,
                    child: Text(
                      widget.hotel.name,
                      style: TextStyle(
                          letterSpacing: 1.1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 42.0),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildRatingStars(widget.hotel.rating),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: Text(
                      widget.hotel.description,
                      style: TextStyle(
                        color: Colors.white54,
                        height: 1.3,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "READ MORE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "\$" + widget.hotel.price.toString() + " / night",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          InkWell(
                            child: Text(
                              "Take me there!",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 14.0,
                              ),
                            ),
                            onTap: () => launch(widget.hotel.url),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
