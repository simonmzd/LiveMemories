class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing, :auth, :home]

  def landing
  end

  def auth
  end

  def home
  end

  def dashboard
    @my_concerts = Concert.where(user: current_user)
    @my_contents = Content.where(user: current_user)
  end
end
