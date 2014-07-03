require 'spec_helper'

describe 'volunteers' do |variable|
	describe 'data transformations' do
		it 'should make a full name' do
			volunteer = FactoryGirl.build 'volunteer', first_name: 'Tim', last_name: 'Howard'
			volunteer.name.should match("Tim Howard")
		end

		it 'should provide a last initial' do
			volunteer = FactoryGirl.build 'volunteer', last_name: 'Howard'
			volunteer.last_name_initial.should match("H")
		end
	end
end