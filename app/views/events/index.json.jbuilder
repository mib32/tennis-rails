json.array!(@events) do |event|
  json.extract! event, :id, :start, :end, :description
  json.owned event.owned_by(current_user)
    # 'true'
  	# if current_user && event.order && current_user.id == event.order.user.id
  		# 'true'
		# else
			# 'false'
		# end
  # end
end
