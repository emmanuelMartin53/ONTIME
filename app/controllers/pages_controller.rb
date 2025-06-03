class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user || User.first
    @flight = Flight.where('takeoff_time > ?', Time.now).order(:takeoff_time).first
    @flights = Flight.where('takeoff_time > ?', Time.now)
    @tasks = Task.all
  end
end
