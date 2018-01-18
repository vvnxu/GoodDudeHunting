class Request < ActiveRecord::Base
belongs_to:user
has_many:donations

end

# @request = Request.find(...)

# .erb
# <ul>
# <% @request.donations.each |donation| do %>
# 	<li>
# 		<%= donation.user.name %>
# 	</li>
# <% end %>
# </ul>
	