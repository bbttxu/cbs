# application_helpers.rb

require 'spec_helper'

describe ApplicationHelper, :type => :helper do
	describe "uniq id" do
		it "should be relatively unique" do
			ids = []

			100.times do
				ids << uniq_id
			end

			ids.uniq.count.should eq 100
		end
	end

	describe "standard_datetime" do
		it "should produce a format chronic can parse" do
			date = Chronic.parse "29th of july, 1918, 17:00:00"

			standard_datetime(date).should eq "1918-07-29 17:00"
		end
	end

  describe "active_link" do
    it "should should an active link if active" do
      pending "write test"
      assert false
    end

    it "should show regular link when not active" do
      pending "write test"
      assert false
    end
  end
end
