class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @authors }
    end
  end

  def books_index

  end
end
