class BooksController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created the book successfully."
      redirect_to users_path
    else
      flash.now[:alert] = "Error"
      redirect_to root_path
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end