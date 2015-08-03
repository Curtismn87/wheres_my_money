class BudgetsController < ApplicationController

  def show
    @stores = Store.all
  end

end
