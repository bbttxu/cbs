class Session < ActiveRecord::Base
	validates :volunteer_id, :presence => true
	validates :shop_id, :presence => true

	belongs_to :volunteer
	belongs_to :shop
end
