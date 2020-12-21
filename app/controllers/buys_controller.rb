class BuysController < ApplicationController
  def index
    @form = Form.new
    user_item
    if current_user == nil
      redirect_to new_user_registration_path
    elsif (current_user.id == @item.user.id) || (@item.buy)#出品者の場合もしくは購入済みの場合 
      redirect_to root_path
    end
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    user_item
    @form = Form.new(buy_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buy_params
    params.require(:form).permit(:postal_code, :prefecture_id, :municipality, :number, :phone_number, :building_name, ).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end


  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buy_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def user_item
    @item = Item.find(params[:item_id],params[:user_id])
  end
end



