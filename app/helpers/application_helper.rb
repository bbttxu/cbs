require 'haml'
require 'chronic'

module ApplicationHelper
	# chronic will parse this no problem
	def standard_datetime( data )
		data.strftime('%Y-%m-%d %H:%M')
	end

	def uniq_id
		('a'..'z').to_a.shuffle[0,8].join
	end
end
