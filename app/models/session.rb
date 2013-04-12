# class Session < ActiveRecord::Base
# 	validates :volunteer_id, :presence => true
# 	validates :shop_id, :presence => true
# 	validates :starts_at, :presence => true

# 	belongs_to :volunteer
# 	belongs_to :shop


# 	default_scope order("starts_at DESC, ends_at DESC")
# 	scope :current, where(:ends_at => nil )

# 	def hours_worked
# 		ending_time = self.ends_at ? self.ends_at : Time.now

# 		return ((ending_time - self.starts_at).to_f / 36).to_i / 100.0
# 	end


# 	def close
# 		self.ends_at = Time.now
# 	end
# end


class Session
  include MongoMapper::Document
  plugin MongoMapper::Plugins::IdentityMap

  belongs_to :shop
  belongs_to :volunteer

  key :starts_at, Time
  key :ends_at, Time
  key :reason_for_visit, String
  key :notes, String
  key :migration_key, String
  key :is_volunteer, Boolean
  timestamps!

	scope :current, where( "ends_at" => nil)
	scope :open, :current

  scope :default, order("ends_at DESC")


	def hours_worked
		ending_time = self.ends_at ? self.ends_at : Time.now

		return ((ending_time - self.starts_at).to_f / 36).to_i / 100.0
	end

end