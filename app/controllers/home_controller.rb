class HomeController < ApplicationController
  def index
    redirect_to dashboard_items_path if current_user
  end
end
