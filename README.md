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

### Create a Movie
curl -H "Content-type: application/json" \
     -X POST -d '{
        "title": "Triplets of Belleville",
        "genre": "drama",
        "director": "Sylvain Chomet",
        "prod_year": "2003",
        "rating": 3
       }' http://localhost:3000/movies

### Update a Movie
curl -H "Content-type: application/json" \
     -X PUT -d '{
        "title": "The Triplets of Belleville",
        "rating": 5
       }' http://localhost:3000/movies/1

### Create an Actor
curl -H "Content-type: application/json" \
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
curl -H "Content-type: application/json" \
     -X POST -d '{
        "subject": "Cartoon depicting a mafia after the Tour-the-France",
        "body": "Madame Souza, an elderly woman, instills in her grandson Champion (for who she acts as his guardian) a love of cycling. As a young man, he does become a dedicated road racer with his grandmother as his trainer. During a mountainous leg of the Tour de France in which Champion is racing, he goes missing. Evidence points to him being kidnapped. Indeed, he and two of his competitors were kidnapped, the kidnappers who want to use the threesome's unique skills for nefarious purposes. With Champion's overweight and faithful pet dog Bruno at her side, Madame Souza goes looking for Champion. Their trek takes them overseas to the town of Belleville. Without any money, Madame Souza and Bruno are befriended and taken in by three eccentric elderly women, who were once the renowned jazz singing group The Triplets of Belleville. The triplets help Madame Souza and Bruno try to locate and rescue Champion."
       }' http://localhost:3000/movies/1/comments