class AlertsController < ApplicationController

  protect_from_forgery with: :null_session, only: [:upvote, :downvote]

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

    @flight = Flight.find(params[:flight_id])
    @alert = Alert.new(alert_params)
    @alert.flight = Flight.find(params[:flight_id])
    @alert.user = current_user

    if @alert.save
      @alert.user.increment!(:point, 3)
      redirect_to @flight, notice: "+ 3points"
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
    pastVote = Vote.where(user_id: params[:user], alert: alert)

    if pastVote.length < 1

      @vote = Vote.new()
      @vote.user = current_user
      @vote.alert = alert
      @vote.up = true
      @vote.save!

      alert.increment!(:note)

      redirect_to flight_path(alert.flight)
    end
  end

  def downvote
    alert = Alert.find(params[:id])
    pastVote = Vote.where(user_id: params[:user], alert: alert)

    if pastVote.length < 1
      @vote = Vote.new()
      @vote.user = current_user
      @vote.alert = alert
      @vote.up = false
      @vote.save!

      alert.decrement!(:note)

      if alert.note <= 0
        tablesVote = alert.votes
        tablesVote.update_all(alert_id: nil)
        alert.destroy
        respond_to do |format|
          format.turbo_stream do
            render turbo_stream: turbo_stream.remove("alert_#{alert.id}")
          end
          format.html { redirect_to flight_path(alert.flight), notice: "Alerte supprimée"}
        end
      else
        redirect_to flight_path(alert.flight)
      end
    end
  end

    private

  def alert_params
    params.require(:alert).permit(:content)
  end


end
