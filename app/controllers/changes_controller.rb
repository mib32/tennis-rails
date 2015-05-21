# class ChangesController < ApplicationController
#   respond_to :json
#   def create
#     ActiveRecord::Base.transaction do
#       params[:_json].each do |param|
#         @e = Event.find param[:event][:id]
#         if @e.order.user.id == current_user.id
#           @e.update! start: param[:event][:start], end: param[:event][:end]

#           total = @e.court.change_price
#           current_user.wallet.withdraw!(total)
#           @e.court.stadium.user.wallet.deposit!(total)
#         end
#       end

#     end
#   respond_with @e, location: event_url(@e, court_id: @e.court )
#   end
# end
