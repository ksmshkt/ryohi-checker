class ToppagesController < ApplicationController
  def index
    redirect_to travels_path if logged_in?
  end
end
