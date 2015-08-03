class StoresController < ApplicationController
  def index
    @stores = Store.all
    @grandTotal = 0
  end
  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end
  def create
    @store = Store.create(store_params)
    redirect_to stores_path
  end

  def edit
      @store = Store.find(params[:id])
  end

  def update
      @store = Store.find(params[:id])
      @store.update(store_params)
      redirect_to store_path(@store)
  end

  private

  def store_params
    params.require(:store).permit(:name, :total_spent, :created_at)
  end

end
