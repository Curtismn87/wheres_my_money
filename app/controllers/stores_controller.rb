class StoresController < ApplicationController
# Will not update total_spent if individual store page isn't loaded
before_action :authenticate_user!, only: [:index, :create, :edit, :update, :destroy]

  # AM: Interesting approach to tallying up total spending!
  # AM: Do you think you could condense that functionality into a method so that it's in your Store model and not the view?

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

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to stores_path
  end


  private

  def store_params
    params.require(:store).permit(:name, :total_spent, :created_at)
  end

end
