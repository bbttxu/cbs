
require 'active_model'
require 'rspec/rails/extensions'
require File.expand_path('app/validators/email_validator')

class EmailValidatable
  include ActiveModel::Validations
  attr_accessor :email
  validates :email, email: true
end

describe EmailValidator do

  subject { EmailValidatable.new }

  describe "with an email" do
    it "should be valid" do
      emails = ["bbttxu@gmail.com"]
      emails.each do |email|
        subject.email = email
        subject.should be_valid
      end
    end

    it "should NOT be valid" do
      emails = ["bbttxu@gmail.c0m", "bbttxu@gmail"]
      emails.each do |email|
        subject.email = email
        subject.should_not be_valid
      end
    end

  end
end