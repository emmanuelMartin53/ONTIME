class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @flights = Flight.where(user: @user).where('takeoff_time > ?', Time.now)
    @flight = @flights.order(:takeoff_time).first
    @tasks = Task.where(user: @user)
  end
end
