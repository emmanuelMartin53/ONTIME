class PagesController < ApplicationController

  def home
    @user = current_user
    @flights = Flight.where(user: @user).where('takeoff_time > ?', Time.current)
    @flight = @flights.order(:takeoff_time).first
    @tasks = Task.where(taskable: @user)
  end

end
