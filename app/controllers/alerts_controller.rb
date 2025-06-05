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
    @alert.user = current_user
    @alert.save
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

  def alert_params
    params.require(:alert).permit(:content)
  end

end
