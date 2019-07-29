
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @create_article = Article.create(params)
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    @show_article = Article.find(params[:id])
    @content = @show_article.content
    @title = @show_article.title
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    @article2 = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article_edited = Article.find(params[:id])
    @article_edited.title = params[:title]
    @article_edited.content = params[:content]
    @article_edited.save

    redirect "/articles/#{params[:id]}"
  end

  delete '/articles/:id/delete' do
    @article3 = Article.find(params[:id])
    @article3.destroy
  end

end

