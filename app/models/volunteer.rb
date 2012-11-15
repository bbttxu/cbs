class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Volunteer < ActiveRecord::Base
	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :uniqueness => true, :email => true

	has_many :sessions
	has_many :shops, :through => :sessions

	default_scope order(:last_name)

	def name
		[self.first_name, self.last_name].reject{|x|x == ""}.join(" ")
	end

	def open_sessions
		sessions.where("ends_at" => nil)
	end
end
