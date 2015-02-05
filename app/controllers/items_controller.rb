class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @items = Item.where(availability: true)
  end

  def show
    respond_with(@item)
  end

  def new
    @item = Item.new
    respond_with(@item)
  end

  def edit
    authorize! :manage, @item
  end

  def create
    @item = current_user.items.new(item_params)
    @item.save
    respond_with(@item)
  end

  def update
    authorize! :manage, @item
    @item.update(item_params)
    respond_with(@item)
  end

  def destroy
    authorize! :manage, @item
    @item.destroy
    respond_with(@item)
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :creator, :description, :price, :availability)
    end
end
