class Session < ActiveRecord::Base
	validates :volunteer_id, :presence => true
	validates :shop_id, :presence => true
	validates :starts_at, :presence => true

	belongs_to :volunteer
	belongs_to :shop


	default_scope order("starts_at DESC, ends_at DESC")
	scope :current, where(:ends_at => nil )

	def hours_worked
		ending_time = self.ends_at ? self.ends_at : Time.now

		return ((ending_time - self.starts_at).to_f / 36).to_i / 100.0 
	end


	def close
		self.ends_at = Time.now
	end
end
