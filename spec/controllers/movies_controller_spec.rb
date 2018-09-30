require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie) { FactoryBot.create(:movie, title: "MyTitle") }

  # it "gets movies" do
  #   headers = {'Authorization' => "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzg0MjcxOTF9.ol9mmW2MWysoPLWLU5JvZIkEzbuBOlSSZXhmJPBJakE" }
  #   get '/movies', headers: headers
  #   expect(response).to have_http_status(200)
  # end

  # describe "create new movie" do
  #   it "has a created status code 201" do
  #     # request.env['Authorization'] = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1Mzg0MjcxOTF9.ol9mmW2MWysoPLWLU5JvZIkEzbuBOlSSZXhmJPBJakE"
  #     params = { 
  #                 title: "Mytitle", 
  #                 genre: "drama", 
  #                 director: "Susan Myer", 
  #                 prod_year: 2018, 
  #                 rating: 5 
  #               }
  #     post :create, params: params, headers: {'Authorization'=>"SECRET_TOKEN"}
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
end
