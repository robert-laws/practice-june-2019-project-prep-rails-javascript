class AuthorsController < ApplicationController
  def index
    @author = Author.new
    @authors = Author.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @authors }
    end
    
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    render json: @author, status: 201
  end

  private

  def author_params
    params.require(:author).permit(:name, :age, :location)
  end
end
