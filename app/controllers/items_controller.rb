class ItemsController < ApplicationController

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
    @items = Item.find(params[:id])
  end

  def edit
    beforeUpdate
  end

  def update
    beforeUpdate
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
   

  private

  def item_params
    params.require(:item).permit(:image,:name,:explanation,:genre_id,:product_condition_id,:delivery_fee_id,:prefecture_id,:guideline_id,:price).merge(user_id: current_user.id)
  end

  def beforeUpdate
    @item = Item.find(params[:id])
  end

end