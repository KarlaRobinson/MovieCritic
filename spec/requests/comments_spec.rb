require 'rails_helper'

RSpec.describe CommentsController, type: :request do
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
      
      #POST /comments
      params = { 
                  subject: "My Subject", 
                  body: "The plot is entertaining and 
                          the acting makes it worth it." 
                }
      post '/movies/1/comments', params: params, headers: headers
      expect(response.status).to eq(201)
      expect(movie.comments.count).to eq(1)
      expect(movie.comments.first.subject).to eq("My Subject")
      
      #GET /comments
      get '/movies/1/comments', params: params, headers: headers
      expect(response).to have_http_status(200)

      #GET /comments/1
      get '/movies/1/comments/1', headers: headers
      expect(response.status).to eq(200)
      expect(response.body).to eq(Comment.first.to_json)

      #PUT /comments/1
      params = { subject: "My New Subject" }
      put '/movies/1/comments/1', params: params, headers: headers
      expect(response.status).to eq(204)
      expect(Comment.first.subject).to eq("My New Subject")

      #DELETE /comments/1
      delete '/movies/1/comments/1', headers: headers
      expect(response.status).to eq(204)
      expect(Comment.count).to eq(0)
    end
  end
end




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
