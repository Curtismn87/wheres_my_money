class StoresController < ApplicationController
  def index
    @stores = Store.all
    @grandTotal = 0
  end
  def show
    @store = Store.find(params[:id])
  end

def storeAmount
  @store = Store.find(params[:id])
  @store.items.each do |items|
    @store.total_spent = items.amount
    @store.update()
  end
end



end
