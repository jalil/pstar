require 'rails_helper'

RSpec.describe VideosController, :type => :controller do
  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index temples' do
      get :index
      expect(response).to render_template("index")
    end

    it 'loads all of the videos into @videos' do
      videos = Video.create(title: "My summer fun", url: "www.cnn.com", image: 'mypic.jpg')
      get :index
      expect(assigns(:videos)).to eq [videos]
    end
  end
end
