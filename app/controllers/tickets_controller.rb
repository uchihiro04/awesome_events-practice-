class TicketsController < ApplicationController
  def new
    raise ActionController::RoutingError, "ログイン状態でTicketsController#newにアクセス"
  end

  def create
    event = Event.find(params[:event_id])
    @ticket = current_user.tickets.build do |t|
      t.event = event
      t.comment = ticket_params[:comment]
    end

    if @ticket.save
      redirect_to event, notice: "このイベントに参加表明しました"
    else
      @event = event
      respond_to do |format|
        format.turbo_stream
        format.html do
          render "events/show", status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: "このイベントの参加をキャンセルしました"
  end


  private

  def ticket_params
    params.require(:ticket).permit(:comment)
  end
end
