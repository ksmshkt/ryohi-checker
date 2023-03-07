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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
