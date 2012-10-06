class Shop < ActiveRecord::Base
	has_many :sessions
	has_many :volunteers, :through => :sessions

	default_scope order(:starts_at)

	scope :upcoming, lambda { where("ends_at > ?", DateTime.zone.now) }
	scope :past, lambda { where("ends_at =< ?", Time.zone.now) }
end
