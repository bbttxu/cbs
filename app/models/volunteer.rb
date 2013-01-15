class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class PhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, phone_number)
		return true if phone_number.blank?

		phone_formats = [
			/^\(\d\d\d\) \d\d\d-\d\d\d\d/,
			/^\d\d\d\.\d\d\d\.\d\d\d\d/,
			/^\d\d\d\-\d\d\d\-\d\d\d\d/
		]

		phone_formats.each do |format|		
			return true if phone_number.match( format )
		end

		record.errors[attribute] << (options[:message] || "Phone format isn't recognized")
	end
end

class Volunteer < ActiveRecord::Base
	validates :first_name, :presence => true
	validates :last_name, :presence => true

	validates :email, :uniqueness => true, :allow_blank => true, :email => true
	validates :phone_number, :uniqueness => true, :allow_blank => true, :phone_number => true

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
