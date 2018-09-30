This is an OOP REST API intended for users to list their favorite movies, as well as, their rating for each movie. They can also write comments for each movie.

Users can add movies, rate their movies on a scale of 1-5, and add comments on any of their movies.

To create an account, users must provide their name, email and birthday.

Movie descriptions include the movie title, genre, actors, director, prod_year and rating, as well, as a comment section.

* Ruby version
2.4.0

* Rails version
5.2.1

* Run the test suite: $bundle exec rspec

* Deploy by lifting the rails server: $rails s

## Usage examples

### Retrieve JWT token
curl -H "Content-Type: application/json" \
    -X POST -d '{
    "email":"example@mail.com",
    "password":"123123123"
    }' http://localhost:3000/authenticate


### Create a Movie
curl -H "Authorization: YOUR_SECRET_JWT" \
     -X POST -d '{
        "title": "Triplets of Belleville",
        "genre": "drama",
        "director": "Sylvain Chomet",
        "prod_year": 2003,
        "rating": 3
       }' http://localhost:3000/movies

Movie.create!(title: 'Triplets of Belleville' , genre: 'drama' , director: 'Sylvain Chomet', prod_year: 2003, rating: 3)


### Update a Movie
curl -H "Content-type: application/json" \
     -X PUT -d '{
        "title": "The Triplets of Belleville",
        "rating": 5
       }' http://localhost:3000/movies/1

### Get all Movies
curl -H "Authorization: YOUR_SECRET_JWT" \
     -X GET -d '{}' http://localhost:3000/movies

### Create an Actor
curl -H "Authorization: YOUR_SECRET_JWT" \
     -X POST -d '{
        "name": "Monica Viegas",
        "role": "voice of Madame Souza"
       }' http://localhost:3000/movies/1/actors

curl -H "Content-type: application/json" \
     -X POST -d '{
        "name": "Jean-Claude Donda",
        "role": "protagonist"
       }' http://localhost:3000/movies/1/actors

### Delete Actor
curl -H "Content-type: application/json" \
     -X DELETE -d '{}' http://localhost:3000/movies/1/actors/2

### Create a Comment
curl -H "Authorization: YOUR_SECRET_JWT" \
     -X POST -d '{
        "subject": "Cartoon depicting a mafia after the Tour-the-France",
        "body": "Madame Souza, an elderly woman, instills in her grandson Champion a love of cycling. As a young man, he does become a dedicated road racer with his grandmother as his trainer. During a mountainous leg of the Tour de France Champion goes missing. He and two other cyclists were kidnapped. The kidnappers want to use the three cyclists for nefarious purposes. With the overweight and faithful pet dog Bruno at her side, Madame Souza goes looking for Champion. Their trek takes them overseas to the town of Belleville. Madame Souza and Bruno are befriended and taken in by three eccentric elderly women, the renowned jazz group The Triplets of Belleville. They help Madame Souza and Bruno try to locate and rescue Champion."
       }' http://localhost:3000/movies/1/comments



