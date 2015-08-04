class BudgetsController < ApplicationController


  def show
    @checker = []
    calculate_total_spent
  end

  def check
    calculate_total_spent
    @user_input = budget_params["checker"]
    @checker = []
    Store.all.each do |store|
      @user_input.each do |input|
        if store.name == input
          @checker.push(store.name)
        end
      end
    end
    render :show
  end

def calculate_total_spent
  @total_spent = 0
  @stores = Store.all
  @stores.each do |spent|
    @total_spent = @total_spent + spent.total_spent
  end
end

private
def budget_params
  params.permit(:checker => [])
end

end
