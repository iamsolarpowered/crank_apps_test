class HomeController < ApplicationController
  def index
    redirect_to current_user if current_user
  end

end
