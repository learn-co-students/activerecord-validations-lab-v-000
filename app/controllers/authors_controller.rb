class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    @author.update(post_params)
    redirect_to author_path(@author)
  end

  def create
    binding.pry
    @author = Author.new(post_params)
    @author.save
    redirect_to author_path(@author)
  end

  def show
    binding.pry
    @author = Author.find(params[:id])
  end

  private

    def post_params
      params.require(:author).permit(:name, :phone_number)
    end


end
