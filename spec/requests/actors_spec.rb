require 'rails_helper'

RSpec.describe ActorsController, type: :request do
  let(:user) { FactoryBot.create(:user) }

  context "authenticate user" do
    it "returns Secret JWT token" do
      movie = user.movies.create!(title: "MyTitle",
                              genre: "drama",
                              director: "Susan Myer",
                              prod_year: 2018,
                              rating: 5)

      #Retrieve Token
      params = {email: user.email, password: user.password}
      post '/authenticate', params: params
      expect(response).to have_http_status(200)
      jw_token = JSON.parse(response.body)["auth_token"]

      #Set header with SECRET TOKEN for all examples
      headers = {'Authorization' => jw_token }
      
      #POST /actors
      params = { 
                  name: "My Name", 
                  role: "production assistant" 
                }
      post '/movies/1/actors', params: params, headers: headers
      expect(response.status).to eq(201)
      expect(movie.actors.count).to eq(1)
      expect(movie.actors.first.name).to eq("My Name")
      
      #GET /actors
      get '/movies/1/actors', params: params, headers: headers
      expect(response).to have_http_status(200)

      #GET /actors/1
      get '/movies/1/actors/1', headers: headers
      expect(response.status).to eq(200)
      expect(response.body).to eq(Actor.first.to_json)

      #PUT /actors/1
      params = { name: "My New Name" }
      put '/movies/1/actors/1', params: params, headers: headers
      expect(response.status).to eq(204)
      expect(Actor.first.name).to eq("My New Name")

      #DELETE /actors/1
      delete '/movies/1/actors/1', headers: headers
      expect(response.status).to eq(204)
      expect(Actor.count).to eq(0)
    end
  end
end


  # let(:movie) { FactoryBot.create(:movie) }
  # let(:actor) { FactoryBot.create(:actor, name: "Karla", movie_id: movie.id) }

  # describe "index actors" do
  #   it "has a 200 status code" do
  #     params = { movie_id: movie.id }
  #     get :index, params: params
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "create new actor" do
  #   it "has a created status code 201 and 1 comment" do
  #     params = { 
  #                 name: "Karla Robinson", 
  #                 role: "protagonist",
  #                 movie_id: movie.id 
  #               }
  #     post :create, params: params
  #     expect(response.status).to eq(201)
  #     expect(movie.reload.actors.length).to eq(1)
  #   end
  # end

  # describe "show first actor of movie" do
  #   it "has a 200 status code" do
  #     params = { movie_id: movie.id, id: actor.id }
  #     get :show, params: params
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq(actor.to_json)
  #   end
  # end

  # describe "update actor" do
  #   it "has original name" do
  #     expect(actor.name).to eq("Karla")
  #   end

  #   it "has updated name" do
  #     params = { id: actor.id, movie_id: movie.id, name: "Karla Robinson" }
  #     put :update, params: params
  #     expect(response.status).to eq(204)
  #     expect(actor.reload.name).to eq("Karla Robinson")
  #   end
  # end

  # describe "destroy first actor" do
  #   it "returns no content code 204" do
  #     params = { id: actor.id, movie_id: movie.id }
  #     delete :destroy, params: params
  #     expect(response.status).to eq(204)
  #   end
  # end
