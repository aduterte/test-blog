
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/blogs"
  end

  get '/blogs' do
    @blogs = Blog.all 
    erb :'/Blogs/index'
  end

  get '/blogs/new' do
    @date = Date.today
    erb :'/Blogs/new'
  end

  post '/blogs' do
    @blog = Blog.create(params)
    redirect "/blogs/#{@blog.id}"
  end

  get '/blogs/:id' do
    @blog = Blog.find(params[:id])
    erb :'/Blogs/show'
  end

  get '/blogs/:id/edit' do
    @blog = Blog.find(params[:id])
    erb :'/Blogs/edit'
  end

  patch '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.update(params[:blog])
    redirect "/blogs/#{blog.id}"
  end

  delete '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.destroy
    redirect "/blogs"
  end
end
