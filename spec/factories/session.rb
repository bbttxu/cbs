FactoryGirl.define do
  factory :session do
  	starts_at Chronic.parse ("an hour ago")
  	# ends_at Chronic.parse ("in an hour")
  end
end