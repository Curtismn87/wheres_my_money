class ItemsController < ApplicationController
  def show
    @store = Store.find(params[:store_id])
  end

  def new
    @store = Store.find(params[:store_id])
    @item = Item.new
  end

  def create
    @store = Store.find(params[:store_id])
    @item = @store.items.create(item_params)
    redirect_to store_path(@store)
  end

  def edit
    @item = Item.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def update
    @item = Item.find(params[:id])
    @store = Store.find(params[:store_id])
    @item.update(item_params)
    redirect_to store_path(@store)
  end

  def destroy
    @item = Item.find(params[:id])
    @store = Store.find(params[:store_id])
    @item.destroy
    redirect_to store_path(@store)
  end




private
  def item_params
    params.require(:item).permit(:name, :amount, :store_id)
  end

end
