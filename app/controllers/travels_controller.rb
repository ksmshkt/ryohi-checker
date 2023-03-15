class TravelsController < ApplicationController

  before_action :require_user_logged_in
  before_action :set_travel, only: [:show, :edit, :update, :destroy]

	def index
		@travels = current_user.travels.all.page(params[:page]).per(3)
	end

  def show
  end

  def new
		@travel = Travel.new
  end

  def create
		@travel = current_user.travels.build(travel_params)

    if @travel.save
      flash[:success] = '新しい旅行が追加されました'
      redirect_to travels_path
    else
      flash.now[:danger] = '新しい旅行の追加に失敗しました'
      render :new, status: :unprocessable_entity
    end

  end

  def edit
  end

  def update

    if @travel.update(travel_params)
      flash[:success] = 'travel は正常に更新されました'
      redirect_to @travel
    else
      flash.now[:danger] = 'travel は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @travel.destroy

    flash[:success] = '旅行は正常に削除されました'
    redirect_to travels_url
  end

	private

  def travel_params
    params.require(:travel).permit(:name)
  end

  def set_travel
    @travel = Travel.find(params[:id])
  end

end
