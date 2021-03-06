class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #@buy = Buy.new(params[:buy_id])
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user= current_user
    set_item
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def destroy
    if current_user.id == @item.user.id
      @item.destroy
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:genre_id,:product_condition_id,:delivery_fee_id,:prefecture_id,:guideline_id,:price).merge(user_id: current_user.id, )
  end

  def set_item
    @item = Item.find(params[:id])
  end

end