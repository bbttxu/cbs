require 'spec_helper'

describe 'volunteers' do |variable|
	describe "model" do
		it "should be valid" do
			volunteer = FactoryGirl.build 'volunteer'
			volunteer.should be_valid
		end
	end

	describe 'data transformations' do
		it 'should make a full name' do
			volunteer = FactoryGirl.build 'volunteer', first_name: 'Tim', last_name: 'Howard'
			volunteer.name.should match("Tim Howard")
		end

		it 'should provide a last initial' do
			volunteer = FactoryGirl.build 'volunteer', last_name: 'Howard'
			volunteer.last_name_initial.should match("H")
		end

    it 'should be possible to be on a mailing list' do
      volunteer = FactoryGirl.build 'volunteer', can_email: true
      volunteer.can_email.should be(true)
    end
  end

  describe 'last date of activity' do
    it 'should be zero if volunteer has worked zero shops' do
      volunteer = FactoryGirl.build 'volunteer'
      volunteer.last_active().should be(false)
    end

    it 'should provide date of last activity' do
      date = Chronic.parse("Jul 1, 1978, 3pm")
      volunteer = FactoryGirl.create 'volunteer'
      session = FactoryGirl.create 'session', starts_at: date
      volunteer.sessions << session
      volunteer.last_active().to_i.should be(date.to_i)
    end

    it 'should provide date of last activity since given date' do
      date = Chronic.parse("Jul 1, 1978, 3pm")
      since = Chronic.parse("Jul 1, 1978, 5pm")

      volunteer = FactoryGirl.create 'volunteer'
      session = FactoryGirl.create 'session', starts_at: date
      volunteer.sessions << session
      volunteer.last_active(since).should be(false)
    end

	end
end
