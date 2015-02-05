class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def index
    if current_user
      redirect_to books_path
    end
  end

  def dashboard
    @items = current_user.items
  end
end