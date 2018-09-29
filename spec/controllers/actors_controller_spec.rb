require 'rails_helper'

RSpec.describe ActorsController, type: :controller do

  # describe "GET index" do
  #   it "has a 200 status code" do
  #     params = { movie_id: 1 }
  #     get :index, params: params
  #     expect(response.status).to eq(200)
  #   end
  # end
  # describe "GET index" do
  #   it "assigns @teams" do
  #     team = Team.create
  #     get :index
  #     expect(assigns(:teams)).to eq([team])
  #   end

  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end

  # describe "GET #index" do
  #   it "reads like a sentence (almost)" do
      
  #     get :index
  #     params = { id: 1 }

  #     get :edit, params # old non-kwarg style
  #     get :edit, params: params # new kwarg style
      
  #     params = { widget: { description: 'Hello World' } }
  #     params.merge!(format: :js) # Specify format for AJAX/JS responses (e.g. create.js.erb view)
      
  #     post :create, params # old non-kwarg style
  #     post :create, params: params # new kwarg style
      
  #     # All optional kwargs:
  #     post :create,
  #       params: {}, # hash with HTTP parameters, may be nil
  #       body: "...", # request body string, appropriately encoded (application/x-www-form-urlencoded or multipart/form-data)
  #       session: {}, # hash of parameters to store in session, may be nil.
  #       flash: {}, # hash of parameters to store in flash, may be nil.
  #       format: :json, # Request format (string or symbol), defaults to nil.
  #       as: :json # Content type must be symbol that corresponds to a mime type, defaults to nil.
      
  #     # Testing 404s in controllers (assuming default Rails handling of RecordNotFound)
  #     expect { delete :destroy, { id: 'unknown' } }.to raise_error(ActiveRecord::RecordNotFound)
      
  #     # Rails `:symbolized` status codes at end of each status code page at http://httpstatus.es/
  #     expect(response).to have_http_status(:success) # 200
  #     expect(response).to have_http_status(:forbidden) # 403
      
  #     expect(response).to redirect_to foo_path
  #     expect(response).to render_template(:template_filename_without_extension)
  #     expect(response).to render_template(:destroy)
      
  #     # Need response.body? Requires render_views call outside "it" block (see above & read given URL)
  #     expect(response.body).to match /Bestsellers/ 
  #     expect(response.body).to include "Bestsellers"
      
  #     expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
  #     expect(response.headers["Content-Type"]).to eq "text/javascript; charset=utf-8"
      
  #     # assigns(:foobar) accesses the @foobar instance variable
  #     # the controller method made available to the view
      
  #     # Think of assigns(:widgets) as @widgets in the controller method
  #     expect(assigns(:widgets)).to eq([widget1, widget2, widget3])

  #     # Think of assigns(:product) as @product in the controller method
  #     expect(assigns(:product)).to eq(bestseller)
  #     expect(assigns(:cat)).to be_cool # cat.cool is a boolean, google "rspec predicate matchers"
  #     expect(assigns(:employee)).to be_a_new(Employee) 
      
    
  #     # Asserting flash messages
  #     expect(flash[:notice]).to eq "Congratulations on buying our stuff!"
  #     expect(flash[:error]).to eq "Buying our stuff failed :-("
  #     expect(flash[:alert]).to eq "You didn't buy any of our stuff!!!"
      
  #     # Query the db to assert changes persisted
  #     expect(Invoice.count).to eq(1)
      
  #     # Reload from db an object fetched in test setup when its record in db
  #     # is updated by controller method, otherwise you're testing stale data
  #     employee.reload
  #     invoice.reload
  #     product.reload
  #     widget.reload

  #   end
    
  # end
end
