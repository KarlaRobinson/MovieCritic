require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  describe "index movies" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "create new movie" do
    it "has a created status code 201" do
      params = { 
                  title: "Mytitle", 
                  genre: "drama", 
                  director: "Susan Myer", 
                  prod_year: 2018, 
                  rating: 5 
                }
      post :create, params: params
      expect(response.status).to eq(201)
    end
  end

  describe "show first movie" do
    let(:movie) { FactoryBot.create(:movie) }

    it "has a 200 status code" do
      params = { id: movie.id }
      get :show, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "update movie" do
    let(:movie) { FactoryBot.create(:movie, title: "MyTitle") }

    it "has original title" do
      expect(movie.title).to eq("MyTitle")
    end

    it "has updated title" do
      params = { id: movie.id, title: "NewTitle" }
      put :update, params: params
      expect(response.status).to eq(204)
      expect(Movie.find(movie.id).title).to eq("NewTitle")
    end
  end

  describe "destroy first movie" do
    let(:movie) { FactoryBot.create(:movie) }

    it "returns no content code 204" do
      params = { id: movie.id }
      delete :destroy, params: params
      expect(response.status).to eq(204)
    end
  end
end
