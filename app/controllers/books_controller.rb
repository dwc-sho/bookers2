class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      # 一時的に
      flash[:notice] = "You have created book successfully."
      redirect_to users_path
    else
      # 一時的に
      flash.now[:alert] = "error"
      redirect_to root_path
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
