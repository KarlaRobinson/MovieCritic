require 'rails_helper'

RSpec.describe ActorsController, type: :controller do
  let(:movie) { FactoryBot.create(:movie) }
  let(:actor) { FactoryBot.create(:actor, name: "Karla", movie_id: movie.id) }

  describe "index actors" do
    it "has a 200 status code" do
      params = { movie_id: movie.id }
      get :index, params: params
      expect(response.status).to eq(200)
    end
  end

  describe "create new actor" do
    it "has a created status code 201 and 1 comment" do
      params = { 
                  name: "Karla Robinson", 
                  role: "protagonist",
                  movie_id: movie.id 
                }
      post :create, params: params
      expect(response.status).to eq(201)
      expect(movie.reload.actors.length).to eq(1)
    end
  end

  describe "show first actor of movie" do
    it "has a 200 status code" do
      params = { movie_id: movie.id, id: actor.id }
      get :show, params: params
      expect(response.status).to eq(200)
      expect(response.body).to eq(actor.to_json)
    end
  end

  describe "update actor" do
    it "has original name" do
      expect(actor.name).to eq("Karla")
    end

    it "has updated name" do
      params = { id: actor.id, movie_id: movie.id, name: "Karla Robinson" }
      put :update, params: params
      expect(response.status).to eq(204)
      expect(actor.reload.name).to eq("Karla Robinson")
    end
  end

  describe "destroy first actor" do
    it "returns no content code 204" do
      params = { id: actor.id, movie_id: movie.id }
      delete :destroy, params: params
      expect(response.status).to eq(204)
    end
  end
end
