class PagesController < ApplicationController

  def home
    @user = current_user
    @flights = Flight.where(user: @user).all
    @flight = @flights.order(:takeoff_time).first
    @tasks = Task.where(user: @user)
  end

  def points
  end
end
