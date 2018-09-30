require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  # let(:movie) { FactoryBot.create(:movie) }
  # let(:comment) { FactoryBot.create(:comment, 
  #                                   subject: "First try.", 
  #                                   movie_id: movie.id) 
  #               }

  # describe "index comments" do
  #   it "has a 200 status code" do
  #     params = { movie_id: movie.id }
  #     get :index, params: params
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "create new comment" do
  #   it "has a created status code 201 and 1 comment" do
  #     params = { 
  #                 subject: "Highly recommendable movie", 
  #                 body: "
  #                         This is the kind of movie you want to watch over and 
  #                         over until you figure out how everything played out.
  #                       ",
  #                 movie_id: movie.id 
  #               }
  #     post :create, params: params
  #     expect(response.status).to eq(201)
  #     expect(movie.reload.comments.length).to eq(1)
  #   end
  # end

  # describe "show first comment of movie" do
  #   it "has a 200 status code" do
  #     params = { movie_id: movie.id, id: comment.id }
  #     get :show, params: params
  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq(comment.to_json)
  #   end
  # end

  # describe "update comment" do
  #   it "has original subject" do
  #     expect(comment.subject).to eq("First try.")
  #   end

  #   it "has updated subject" do
  #     params = { id: comment.id, movie_id: movie.id, subject: "Updated subject." }
  #     put :update, params: params
  #     expect(response.status).to eq(204)
  #     expect(comment.reload.subject).to eq("Updated subject.")
  #   end
  # end

  # describe "destroy first comment" do
  #   it "returns no content code 204" do
  #     params = { id: comment.id, movie_id: movie.id }
  #     delete :destroy, params: params
  #     expect(response.status).to eq(204)
  #   end
  # end
end
