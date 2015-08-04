class BudgetsController < ApplicationController


  def show
  end


def check
  puts budget_params["checker"]
  Store.all.each do |store|
    if store.name == budget_params["checker"]
      @checker = []
      @checker.push(budget_params["checker"])
    end
  end
  render :show
end

private
def budget_params
  params.permit(:checker)
end

end
