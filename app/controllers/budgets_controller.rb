class BudgetsController < ApplicationController


  def show
  end

  def check
    puts budget_params["checker"]
    @test = budget_params["checker"]
    puts @test
    @checker = []
    Store.all.each do |store|
      @test.each do |testing|
      if store.name == testing
        @checker.push(store.name)
      end
    end
    end
    render :show
  end
# def check
#   puts budget_params["checker"]
#   @checker = []
#   Store.all.each do |store|
#     if store.name == budget_params["checker"]
#       @checker.push(budget_params["checker"])
#     end
#   end
#   render :show
# end

private
def budget_params
  params.permit(:checker => [])
end

end
