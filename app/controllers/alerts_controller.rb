class AlertsController < ApplicationController


  def show
      @alert = Alert.find(params[:id])
  end

  def new
      @alert = Alert.new
  end

  def create
    @alert = Alert.new(alerts_params)
    @alert.flight = Flight.find(params[:flight_id])
    @flight = Flight.find(params[:flight_id])
    if @alert.save
      redirect_to @flight, notice: "Signalement effectué"
    else
      redirect_to @flight, notice: "Signalement raté"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def alerts_params
    params.require(:alert).permit(:content)
  end
end
