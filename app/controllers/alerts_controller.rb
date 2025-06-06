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

    @alert = Alert.new(alert_params)
    @alert.flight = Flight.find(params[:flight_id])
    @alert.user = current_user
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
    pastVote = Vote.where(user_id: params[:user], alert: alert)

    if pastVote.length < 1

      @vote = Vote.new()
      @vote.user_id = params[:user]
      @vote.alert = alert
      @vote.up = true
      @vote.save!

      if alert.flight.user == current_user
          redirect_to @flight, notice: "Vous ne pouvez pas voter pour vos propre alertes"
          return
      end

      alert.increment!(:note)
      respond_to do |format|
        format.json { render json: { note: alert.note, user:  params[:user] }, status: :ok }
      end
    end
  end

  def downvote


    alert = Alert.find(params[:id])
    pastVote = Vote.where(user_id: params[:user], alert: alert)

    if pastVote.length < 1
      @vote = Vote.new()
      @vote.user_id = params[:user]
      @vote.alert = alert
      @vote.up = false
      @vote.save!

      if alert.flight.user == params[:user]
        render json: { error: "Action interdite : vous ne pouvez pas voter sur vos propres alertes" }, status: :forbidden

        return
      end
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
  end

    private

  def alert_params
    params.require(:alert).permit(:content)
  end


end
