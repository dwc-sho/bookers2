class BooksController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new
  end
  
  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @user = User.find(@book_detail.user_id)
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created the book successfully."
      redirect_to book_path(@book.id)
    else
      @users = User.all
      @books = Book.all
      @user = User.find(current_user.id)
      render "index"
    end
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end