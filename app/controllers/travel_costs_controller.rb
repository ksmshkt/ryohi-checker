class TravelCostsController < ApplicationController
  before_action :set_travel, only: %i[index new create]
  before_action :set_travel_cost, only: %i[edit update destroy]

  def index
    @travel_costs = @travel.travel_costs
  end

  def new
    @travel_cost = TravelCost.new
  end

  def create
    @travel_cost = @travel.travel_costs.build(travel_cost_params)

    if @travel_cost.save
      flash[:success] = "旅費項目を追加しました。"
      redirect_to travel_costs_path
    else
      flash.now[:danger] = "旅費項目の追加に失敗しました。"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @travel_cost.update(travel_cost_params)
      flash[:success] = "項目を更新しました。"
      redirect_to travel_costs_path(@travel_cost.travel)
    else
      flash.now[:danger] = "項目の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @travel_cost.destroy
    flash[:success] = "項目を削除しました。"
    redirect_back(fallback_location: travel_costs_path)
  end

  private

  def travel_cost_params
    params.require(:travel_cost).permit(:name, :budget, :amount_paid)
  end

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def set_travel_cost
    @travel_cost = TravelCost.find(params[:id])
  end
end
