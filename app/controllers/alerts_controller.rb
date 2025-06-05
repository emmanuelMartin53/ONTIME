class AlertsController < ApplicationController

  protect_from_forgery with: :null_session, only: [:upvote, :downvote]

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


  def upvote
    alert = Alert.find(params[:id])
    alert.increment!(:note)
    respond_to do |format|
      format.json { render json: { note: alert.note }, status: :ok }
    end
  end

  def downvote
    alert = Alert.find(params[:id])
    alert.decrement!(:note)

    if alert.note <= 0
      alert.destroy
      respond_to do |format|
        format.json { render json: { deleted: true, id: alert.id }, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: { note: alert.note }, status: :ok }
      end
    end
  end

  private

  def alerts_params
    params.require(:alert).permit(:content)
  end

end
