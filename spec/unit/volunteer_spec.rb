require 'spec_helper'

describe 'volunteers' do |variable|
	describe 'validations' do
		it 'should make a full name' do
			volunteer = FactoryGirl.build 'volunteer', first_name: 'Tim', last_name: 'Howard'
			volunteer.name.should match("Tim Howard")
		end
	end
end