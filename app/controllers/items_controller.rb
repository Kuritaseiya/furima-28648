class ItemsController < ApplicationController
  #before_action :authenticate_user!, only: [:show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user= current_user
    @items = Item.where(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end
   

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:genre_id,:product_condition_id,:delivery_fee_id,:prefecture_id,:guideline_id,:price).merge(user_id: current_user.id)
  end

end