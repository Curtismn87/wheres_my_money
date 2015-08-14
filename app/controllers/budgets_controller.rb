class BudgetsController < ApplicationController
before_action :authenticate_user!

  def show
    @right_guess = []
    @total_spent = 0
    @guess_spent = 0
    @wrong_guess = []
    calculate_total_spent
  end

  # AM: You use a lot of business logic in your budgets controller. I think you would benefit from delegating a lot of this to a Budget model.
  # AM: It doesn't need to be an ActiveRecord model. It can have no connection to the database.

  # AM: Did not know `casecmp` was a thing!

  def check
    calculate_total_spent
    wrong_guess
    @user_input = budget_params["checker"]
    @right_guess = []
    @guess_spent = 0
    Store.all.each do |store|
      @user_input.each do |input|
        if store.name.casecmp(input) == input.casecmp(store.name)
          @right_guess.push(store.name)
          @guess_spent = @guess_spent + store.total_spent
        end
      end
    end
    @right_guess.each do |right|
      @wrong_guess.each do |wrong|
        if wrong.casecmp(right) == right.casecmp(wrong)
          @wrong_guess.delete(right)
        end
      end
    end

    render :show
  end

def wrong_guess
  @wrong_guess = []
    Store.all.each do |store|
      @wrong_guess.push(store.name)
    end
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
