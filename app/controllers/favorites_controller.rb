class FavoritesController < ApplicationController
  def create
    session[:previous_url] = request.referer
    book = Book.find(params[:book_id])
    current_user.favorites.create(book_id: book.id)
    redirect_to session[:previous_url]
    session.delete(:previous_url)
  end

  def destroy
    session[:previous_url] = request.referer
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to session[:previous_url]
    session.delete(:previous_url)
  end
end
