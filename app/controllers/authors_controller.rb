class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(:name => params[:name], :phone_number => params[:phone_number])
  redirect_to authors_path(@author.id)
  end

  
end
