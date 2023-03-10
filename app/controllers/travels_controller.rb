class TravelsController < ApplicationController
	def index
		@travels = Travel.all
	end

  def show
		@travel = Travel.find(params[:id])
  end

  def new
		@travel = Travel.new
  end

  def create
		@travel = Travel.new(travel_params)

    if @travel.save
      flash[:success] = '新しい旅行が追加されました'
      redirect_to @travel
    else
      flash.now[:danger] = '新しい旅行の追加に失敗しました'
      render :new
    end

  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    @travel = Travel.find(params[:id])

    if @travel.update(travel_params)
      flash[:success] = 'travel は正常に更新されました'
      redirect_to @travel
    else
      flash.now[:danger] = 'travel は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy

    flash[:success] = '旅行は正常に削除されました'
    redirect_to travels_url
  end

	private

	# Strong Parameter
  def travel_params
    params.require(:travel).permit(:name)
  end
end
