
FactoryGirl.define do
  factory :snood, :class => Refinery::Snoods::Snood do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

