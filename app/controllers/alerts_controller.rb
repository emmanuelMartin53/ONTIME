class AlertsController < ApplicationController
<<<<<<< HEAD
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
=======


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
>>>>>>> master
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

<<<<<<< HEAD
  def alert_params
=======
  def alerts_params
>>>>>>> master
    params.require(:alert).permit(:content)
  end
end
