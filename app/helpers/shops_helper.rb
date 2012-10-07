module ShopsHelper
	def shop_date(shop)
		date_components = ["%b %-d"]

		unless Time.now.year == shop.starts_at.year
			date_components << "%Y"
		end

		date = shop.starts_at.strftime date_components.join ", "

		time_start_components = "%I%p"
		unless shop.starts_at.min == 0
			time_start_components = "%I:%M%p"
		end

		if shop.ends_at
			time_end_components = "%I%p"
			unless shop.ends_at.min == 0
				time_end_components = "%I:%M%p"
			end
			time_end = shop.ends_at.strftime time_end_components
		else
			time_end = " -:--"
		end


		time_start = shop.starts_at.strftime time_start_components

		"#{date}, #{time_start}-#{time_end}"

	end

end
