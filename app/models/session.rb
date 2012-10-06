class Session < ActiveRecord::Base
	validates :volunteer_id, :presence => true
	validates :shop_id, :presence => true
	validates :starts_at, :presence => true

	belongs_to :volunteer
	belongs_to :shop

	def hours_worked
		ending_time = self.ends_at ? self.ends_at : Time.now

		return (ending_time - self.starts_at).to_f / 3600
	end
end
