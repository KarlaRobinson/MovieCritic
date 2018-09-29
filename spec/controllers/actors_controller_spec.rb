require 'rails_helper'

RSpec.describe ActorsController, type: :controller do

  describe "index actors" do
    let(:movie) { FactoryBot.create(:movie) }

    it "has a 200 status code" do
      params = { movie_id: movie.id }
      get :index, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "create new actor" do
    let(:movie) { FactoryBot.create(:movie) }

    it "has a created status code 201" do
      params = { 
                  name: "Karla Robinson", 
                  role: "protagonist",
                  movie_id: movie.id 
                }
      post :create, params: params
      expect(response.status).to eq(201)
    end
  end

  describe "show first actor of movie" do
    let(:movie) { FactoryBot.create(:movie) }
    let(:actor) { FactoryBot.create(:actor, movie_id: movie.id) }

    it "has a 200 status code" do
      params = { movie_id: movie.id, id: actor.id }
      get :show, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "update actor" do
    let(:movie) { FactoryBot.create(:movie) }
    let(:actor) { FactoryBot.create(:actor, name: "Karla", movie_id: movie.id) }


    it "has original name" do
      expect(actor.name).to eq("Karla")
    end

    it "has updated name" do
      params = { id: actor.id, movie_id: movie.id, name: "Karla Robinson" }
      put :update, params: params
      expect(response.status).to eq(204)
      expect(Actor.find(actor.id).name).to eq("Karla Robinson")
    end
  end

  describe "destroy first movie" do
    let(:movie) { FactoryBot.create(:movie) }
    let(:actor) { FactoryBot.create(:actor, movie_id: movie.id) }

    it "returns no content code 204" do
      params = { id: actor.id, movie_id: movie.id }
      delete :destroy, params: params
      expect(response.status).to eq(204)
    end
  end
end
