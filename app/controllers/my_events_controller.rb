class MyEventsController < EventsController
  layout 'dashboard'
  def index
    @events = current_user.events.order(created_at: :desc)
    respond_to do |format|
      format.json {@events = @events}
      format.html {}
    end
  end

  def grid
  end

  def bulk_process
    # case params[:button]
    # when 'delete'
    #   render action: :destroy
    # when 'pay'
    #   render 'orders/create' 
    # else
    #   redirect_to my_events_path, alert: "Неизвестное действие."
    # end
  end

  def destroy
    Event.where(id: params[:event_ids]).delete_all

    redirect_to my_events_path, notice: 'Успешно удалены.'
  end
end
