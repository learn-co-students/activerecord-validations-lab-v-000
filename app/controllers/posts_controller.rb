class PostsController < ApplicationController

  def index
    @posts = Post.all
    render '/posts/index.html'
  end

  def show
    @post = Post.find(params[:id])
    render '/posts/show.html'
  end

end
