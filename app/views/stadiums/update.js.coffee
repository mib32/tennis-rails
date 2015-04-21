<% if @stadium.errors.messages.any? %>
	<% @stadium.errors.messages.each do |name, msg| %>
		$el = $('form.edit_stadium .stadium_<%= name %>')
		$el.addClass('has-error')
		$el.find('.help-block').remove()
		$el.append("<span class='help-block'><%= msg.join(' ') %></span>")
	<% end %>
<% else %>
	$('form.edit_stadium').html("""<%= render 'success' %>""")
<% end %>
