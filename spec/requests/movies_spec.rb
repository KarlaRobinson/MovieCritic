require 'rails_helper'

RSpec.describe MoviesController, type: :request do
  let(:user) { FactoryBot.create(:user) }

  context "authenticate user" do
    it "returns Secret JWT token" do

      #Retrieve Token
      params = {email: user.email, password: user.password}
      post '/authenticate', params: params
      expect(response).to have_http_status(200)
      jw_token = JSON.parse(response.body)["auth_token"]

      #Set header with SECRET TOKEN for all examples
      headers = {'Authorization' => jw_token }
      
      #GET /movies
      get '/movies', headers: headers
      expect(response).to have_http_status(200)
      expect(response.body).to eq(Movie.all.to_json)

      #POST /movies
      params = { 
                  title: "Mytitle", 
                  genre: "drama", 
                  director: "Susan Myer", 
                  prod_year: 2018, 
                  rating: 5 
                }
      post '/movies', params: params, headers: headers
      expect(response.status).to eq(201)
      expect(Movie.count).to eq(1)
      expect(Movie.first.title).to eq("Mytitle")

      #GET /movies/1
      params = { id: 1 }
      get '/movies', params: params, headers: headers
      expect(response.status).to eq(200)
      expect(response.body).to eq([Movie.first].to_json)

      #PUT /movies/1
      params = { title: "NewTitle" }
      put '/movies/1', params: params, headers: headers
      expect(response.status).to eq(204)
      expect(Movie.first.title).to eq("NewTitle")

      #DELETE /movies/1
      delete '/movies/1', headers: headers
      expect(response.status).to eq(204)
      expect(Movie.count).to eq(0)
    end
  end
end


  # describe "get movies" do
  #   it "has a 200 status code" do
  #     get '/movies'
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # describe "create new movie" do
  #   it "has a created status code 201" do
  #     params = { 
  #                 title: "Mytitle", 
  #                 genre: "drama", 
  #                 director: "Susan Myer", 
  #                 prod_year: 2018, 
  #                 rating: 5 
  #               }
  #     post :create, params: params
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "show first movie" do
  #   it "has a 200 status code" do
  #     params = { id: movie.id }
  #     get :show, params: params
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq(movie.to_json)
  #   end
  # end

  # describe "update movie" do
  #   it "has original title" do
  #     expect(movie.title).to eq("MyTitle")
  #   end

  #   it "has updated title" do
  #     params = { id: movie.id, title: "NewTitle" }
  #     put :update, params: params
  #     expect(response.status).to eq(204)
  #     expect(movie.reload.title).to eq("NewTitle")
  #   end
  # end

  # describe "destroy first movie" do
  #   it "returns no content code 204" do
  #     params = { id: movie.id }
  #     delete :destroy, params: params
  #     expect(response.status).to eq(204)
  #   end
  # end

