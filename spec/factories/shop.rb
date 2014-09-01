FactoryGirl.define do
  factory :shop do
  	starts_at Chronic.parse("an hour ago")
  	ends_at Chronic.parse("in an hour")
  end
end
