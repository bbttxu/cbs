class Shop < ActiveRecord::Base
	has_many :sessions
	has_many :volunteers, :through => :sessions

	default_scope order(:starts_at)
end
