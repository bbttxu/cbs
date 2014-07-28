require 'spec_helper'

describe Session do
	before(:each) do
		@session = FactoryGirl.build :session
	end

	it "should be valid" do
		@session.should be_valid
	end
end
