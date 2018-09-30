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

* Authentications uses: bcrypt, jwt and simple_command

## Usage examples

### Retrieve JWT token
curl -H "Content-Type: application/json" \
    -X POST -d '{
    "email":"example@mail.com",
    "password":"123123123"
    }' http://localhost:3000/authenticate

### Create a Movie
curl -H 'authorization: YOUR_SECRET_TOKEN' \
-X POST http://localhost:3000/movies \
  -F 'title=Triplets of Belleville' \
  -F genre=drama \
  -F 'director=Sylvain Chomet' \
  -F prod_year=2003 \
  -F rating=3

### Update a Movie
curl -H 'authorization: YOUR_SECRET_TOKEN' \
-X PUT http://localhost:3000/movies/1 \
  -F 'title=The Triplets of Belleville' \
  -F rating=5


### Get all Movies
curl -H "Authorization: YOUR_SECRET_TOKEN" \
     -X GET http://localhost:3000/movies

### Create an Actor
curl -H "Authorization: YOUR_SECRET_TOKEN" \
-X POST http://localhost:3000/movies/1/actors \
    -F 'name=Monica Viegas' \
    -F 'role=voice of Madame Souza'

curl -H "Authorization: YOUR_SECRET_TOKEN" \
-X POST http://localhost:3000/movies/1/actors \
    -F 'name=Jean-Claude Donda' \
    -F 'role=protagonist'

### Delete Actor
curl -H "Authorization: YOUR_SECRET_TOKEN" \
    -X DELETE http://localhost:3000/movies/1/actors/2

### Create a Comment
curl -H "Authorization: YOUR_SECRET_TOKEN" \
-X POST http://localhost:3000/movies/1/comments \
    -F 'subject=Cartoon depicting a mafia after the Tour-the-France' \
    -F 'body=Madame Souza, an elderly woman, instills in her grandson Champion a love of cycling. As a young man, he does become a dedicated road racer with his grandmother as his trainer. During a mountainous leg of the Tour de France Champion goes missing. He and two other cyclists were kidnapped. The kidnappers want to use the three cyclists for nefarious purposes. With the overweight and faithful pet dog Bruno at her side, Madame Souza goes looking for Champion. Their trek takes them overseas to the town of Belleville. Madame Souza and Bruno are befriended and taken in by three eccentric elderly women, the renowned jazz group The Triplets of Belleville. They help Madame Souza and Bruno try to locate and rescue Champion.'



