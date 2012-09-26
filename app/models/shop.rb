class Shop < ActiveRecord::Base
	has_many :sessions
	has_many :volunteers, :through => :sessions
end
