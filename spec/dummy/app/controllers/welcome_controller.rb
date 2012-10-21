class WelcomeController < ApplicationController
  def index
  end

  def enable
    Togglify.enable(params[:toggle_name])
    redirect_to root_path
  end

  def disable
    Togglify.disable(params[:toggle_name])
    redirect_to root_path
  end
end
