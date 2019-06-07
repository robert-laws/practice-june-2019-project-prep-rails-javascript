class BooksController < ApplicationController
  def index
    if params[:author_id]
      @books = Author.find(params[:author_id]).books.sorted
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @books }
      end
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @book }
    end
  end
end
