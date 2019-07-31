
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :'articles/new'
  end

  post 'articles/show' do
    @article = Article.create(params)
    erb :'articles/show'
  end

  # get '/articles' do
  #   @articles = Article.all
  #   erb :index
  # end

end
