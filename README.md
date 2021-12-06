# Flutter Movies

Flutter Movies is an application developed with Flutter, Getx and Clean Architecture.
In it you can see the list of popular movies, the top rated ones and see the description of each one.
This application connects to The Movie DB API.

<img src="https://i.imgur.com/PrXYj77.png" alt="drawing" width="300"/>
<img src="https://i.imgur.com/BWpR7sP.png" alt="drawing" width="300"/>
  

# Clean Architecture

![enter image description here](https://miro.medium.com/max/1400/1*WWcsH7w4vAmROLJGXDogFw.png)

In this application, the Clean Architecture concept was implemented for the structuring of the project.

The Entities, Use Cases, Controllers Core and Presentation layers were implemented.

The domain entities were:

 - Actors: The actors of a movie
 - Movie Cover: The summarized version of the movie information.
 - Movie: All the movie information

# GetX

![enter image description here](https://res.cloudinary.com/practicaldev/image/fetch/s--J8e3KWw4--/c_imagga_scale,f_auto,fl_progressive,h_1080,q_auto,w_1080/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/l10fq2kiw28o3mok3v1m.jpg)

GetX was implemented for navigation and state management.

The application has 2 screens:

 - Home
 - Details

The navigation between them was done through GetX and configured in the Routes folder.

# Other packages

The following packages were also used in the application:

 - [Material Design - Flutter](https://material.io/develop/flutter): system of guidelines, components, and tools for Flutter.
 - [json_serializable](https://pub.dev/packages/json_serializable): Provides Dart Build System builders for handling JSON.
 - [Kiwi](https://pub.dev/packages/kiwi): A simple yet efficient IoC container for Dart and Flutter.
