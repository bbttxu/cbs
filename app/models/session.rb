class Session < ActiveRecord::Base
	validates :volunteer_id, :presence => true
	validates :shop_id, :presence => true
	validates :starts_at, :presence => true

	belongs_to :volunteer
	belongs_to :shop

	def hours_worked
		if self.starts_at and self.ends_at
			return (self.ends_at - self.starts_at).to_f / 3600
		end
		"n/a"
	end
end
