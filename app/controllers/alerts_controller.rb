class AlertsController < ApplicationController
  def index
    @alerts = Alert.all
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def new
    @alert = Alert.new
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user
    @alert.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def alert_params
    params.require(:alert).permit(:content)
  end
end
