module ApplicationHelper
	def li_link_to(text, url, options = nil)
		link_to_unless_current text, url, options do |text, url, options|
			Haml::Engine.new("%li.active= link_to(#{text}, #{url}, #{options})").render
		end
	end

	# chronic will parse this no problem
	def standard_datetime( data )
		data.strftime('%Y-%m-%d %H:%M')
	end
end
