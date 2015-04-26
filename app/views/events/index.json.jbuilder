json.array!(@events) do |event|
  json.extract! event, :id, :start, :end, :description
  json.editable event.owned_by current_user
  json.color event.owned_by(current_user) ? 'cadetblue' : 'rgba(255,136,0,0.5)'
    # 'true'
  	# if current_user && event.order && current_user.id == event.order.user.id
  		# 'true'
		# else
			# 'false'
		# end
  # end
end
