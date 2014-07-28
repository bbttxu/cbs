# phone_number_validator_spec.rb

require 'active_model'
require 'rspec/rails/extensions'
require File.expand_path('app/validators/phone_number_validator')

class PhoneValidatable
  include ActiveModel::Validations
  attr_accessor :phone
  validates :phone, phone_number: true
end

describe PhoneNumberValidator do

  subject { PhoneValidatable.new }

  describe "with a valid phone number" do
    it "should be valid" do
      phone_numbers = ["940-867-5309", "(940) 867-5309", "940.867.5309"]
      phone_numbers.each do |phone_number|
        subject.phone = phone_number
        subject.should be_valid
      end
    end

    it "should NOT be valid" do
      phone_numbers = ["940.867-5309", "(940)867-5309", "940.867.530"]
      phone_numbers.each do |phone_number|
        subject.phone = phone_number
        subject.should_not be_valid
      end
    end

  end
end