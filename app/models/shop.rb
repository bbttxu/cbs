
class Shop
  include MongoMapper::Document
  plugin MongoMapper::Plugins::IdentityMap

  many :sessions
  many :volunteers

  key :starts_at, Time, :default => Time.now()
  key :ends_at, Time, :default => nil
  key :location, String
  key :migration_key, String
  timestamps!

	scope :current, lambda { where(:starts_at.lte => Time.zone.now,:ends_at.gte => Time.zone.now) }
  scope :last_year, lambda { where(:ends_at.gte => Time.zone.now - 1.year) }

	def shop_date
		date_components = ["%b %-d"]

		unless Time.now.year == self.starts_at.year
			date_components << "%Y"
		end

		date = self.starts_at.strftime date_components.join ", "

		time_start_components = "%I%p"
		unless self.starts_at.min == 0
			time_start_components = "%I:%M%p"
		end

		unless self.ends_at.nil?
			time_end_components = "%I%p"
			unless self.ends_at.min == 0
				time_end_components = "%I:%M%p"
			end
			time_end = self.ends_at.strftime time_end_components
		else
			time_end = " -:--"
		end


		time_start = self.starts_at.strftime time_start_components

		"#{date}, #{time_start}-#{time_end}"

	end

end

Shop.ensure_index :starts_at
Shop.ensure_index :ends_at