require 'spec_helper'

describe 'shops' do |variable|
	describe 'data formats' do
		it 'should show a readable/parseable date' do
			shop = FactoryGirl.build 'shop', starts_at: Chronic.parse("Jul 1, 1978, 03pm"), ends_at: Chronic.parse("Jul 1, 1978, 05pm")
			shop.shop_date.should match("Jul 1, 1978, 03PM-05PM")
		end
	end
end