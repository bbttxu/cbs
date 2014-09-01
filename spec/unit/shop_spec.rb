require 'spec_helper'

describe Shop, :type => :model do |variable|
	describe 'data formats' do
		it 'should show a readable/parseable date with an ending time' do
			shop = FactoryGirl.build 'shop', starts_at: Chronic.parse("Jul 1, 1978, 3pm"), ends_at: Chronic.parse("Jul 1, 1978, 5pm")
			shop.shop_date.should match("Jul 1, 1978, 03PM-05PM")
    end

		it 'should show a readable/parseable date without an ending time' do
			shop = FactoryGirl.build 'shop', starts_at: Chronic.parse("Jul 1, 1978, 3pm")
			shop.shop_date.should match("Jul 1, 1978, 03PM- -:--")
    end
	end
end
