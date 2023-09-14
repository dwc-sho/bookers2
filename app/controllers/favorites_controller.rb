class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    flash[:notice] = "Create good."
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    flash[:alert] = "Delete good."
    redirect_to request.referer
  end

  private
  def favorite_params
    params.require(:favorite).permit(:good)
  end
end
