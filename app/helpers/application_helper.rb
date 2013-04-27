require 'haml'

module ApplicationHelper



	def li_active_link_to(text, url)
		if is_active_link?(url, :exclusive)
			content_tag :li, :class => "active" do
				link_to text, url
			end
		else
			content_tag :li do
				link_to text, url
			end
		end
	end

	# content_tag

	# chronic will parse this no problem
	def standard_datetime( data )
		data.strftime('%Y-%m-%d %H:%M')
	end

	def uniq_id
		('a'..'z').to_a.shuffle[0,8].join
	end
end
