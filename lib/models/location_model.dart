import 'activity_model.dart';

class Location{
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;
  
  Location({
     this.imageUrl, 
     this.city, 
     this.country, 
     this.description, 
     this.activities
  });
  }

//TODO REMOVE LIST

/*   List<Activity> activities = [
  Activity(
    imageUrl: 'images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: '9:00 am',
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: '1:00 pm',
    rating: 3.0,
    price: 210,
  ),
  Activity(
    imageUrl: 'images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: '12:30 pm',
    rating: 3,
    price: 125,
  ),
]; */

/* List<Location> locations = [
    Location(
    imageUrl: 'images/ålesund.jpg',
    city: 'Ålesund',
    country: 'Norway',
    description: 'Visit Ålesund for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Location(
    imageUrl: 'images/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Location(
    imageUrl: 'images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Location(
    imageUrl: 'images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Location(
    imageUrl: 'images/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Location(
    imageUrl: 'images/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
]; */
  
